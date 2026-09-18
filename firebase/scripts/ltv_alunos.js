/**
 * Análise de tempo de casa (tenure) e LTV dos alunos a partir do Firestore.
 *
 * Como rodar (na pasta firebase/functions, que já tem firebase-admin instalado):
 *   cd firebase/functions && npm install
 *   GOOGLE_APPLICATION_CREDENTIALS=/caminho/service-account.json \
 *     node ../scripts/ltv_alunos.js > ../scripts/ltv_alunos.csv
 *
 * A conta de serviço vem do console Firebase: Configurações do projeto >
 * Contas de serviço > Gerar nova chave privada (projeto ensino-bilingue).
 *
 * O que o script faz, por aluno (coleção `student`):
 *   - primeira aula  = menor data entre bookingCreatedDateTime, bookingRecords[]
 *                      e bFeedDateTime dos feedbacks das reservas do aluno
 *   - última aula    = maior data entre as mesmas fontes
 *   - ativo          = tem ao menos uma reserva com bookingActive == true
 *   - meses de casa  = (hoje - primeira aula) / 30,44 para ativos
 *                      (última aula - primeira aula) / 30,44 para inativos
 *   - aulas dadas    = feedbacks com presença Present (ou Excused) + datas em bookingRecords
 *
 * O tipo de plano (mensal / semestral / anual) não existe no Firestore, então a
 * coluna `plano` sai vazia para você preencher a partir dos contratos.
 *
 * Saída: CSV por aluno no stdout e um resumo no stderr.
 */
const admin = require('firebase-admin');

admin.initializeApp({ credential: admin.credential.applicationDefault() });
const db = admin.firestore();

const MES = 30.44 * 24 * 60 * 60 * 1000;
const toDate = (v) => (v && typeof v.toDate === 'function' ? v.toDate() : v instanceof Date ? v : null);
const min = (a, b) => (!a ? b : !b ? a : a < b ? a : b);
const max = (a, b) => (!a ? b : !b ? a : a > b ? a : b);
const csv = (v) => `"${String(v ?? '').replace(/"/g, '""')}"`;

async function main() {
  const [students, bookings, feedbacks] = await Promise.all([
    db.collection('student').get(),
    db.collection('bookings').get(),
    db.collectionGroup('bookingFeedback').get(),
  ]);

  // feedbacks agrupados por reserva (documento pai)
  const feedByBooking = new Map();
  for (const f of feedbacks.docs) {
    const bookingId = f.ref.parent.parent.id;
    if (!feedByBooking.has(bookingId)) feedByBooking.set(bookingId, []);
    feedByBooking.get(bookingId).push(f.data());
  }

  // reservas agrupadas por aluno
  const bookingsByStudent = new Map();
  for (const b of bookings.docs) {
    const d = b.data();
    const sid = d.bookingStudentRef && d.bookingStudentRef.id;
    if (!sid) continue;
    if (!bookingsByStudent.has(sid)) bookingsByStudent.set(sid, []);
    bookingsByStudent.get(sid).push({ id: b.id, ...d });
  }

  const hoje = new Date();
  const linhas = [];
  for (const s of students.docs) {
    const d = s.data();
    const bs = bookingsByStudent.get(s.id) || [];
    let primeira = null;
    let ultima = null;
    let ativo = false;
    let aulasDadas = 0;
    for (const b of bs) {
      if (b.bookingActive === true) ativo = true;
      const criado = toDate(b.bookingCreatedDateTime);
      primeira = min(primeira, criado);
      ultima = max(ultima, criado);
      for (const r of b.bookingRecords || []) {
        const dt = toDate(r);
        primeira = min(primeira, dt);
        ultima = max(ultima, dt);
        aulasDadas += 1;
      }
      for (const f of feedByBooking.get(b.id) || []) {
        const dt = toDate(f.bFeedDateTime);
        primeira = min(primeira, dt);
        ultima = max(ultima, dt);
        if (f.bFeedAttendance !== 'Absent') aulasDadas += 1;
      }
    }
    if (bs.length === 0) continue; // aluno cadastrado sem nenhuma reserva
    const fim = ativo ? hoje : ultima;
    const meses = primeira && fim ? (fim - primeira) / MES : 0;
    linhas.push({
      id: s.id,
      nome: `${d.studentName || ''} ${d.studentLastName || ''}`.trim(),
      responsavel: d.studentParentRef ? d.studentParentRef.id : '',
      ativo,
      reservas: bs.length,
      reservasAtivas: bs.filter((b) => b.bookingActive === true).length,
      primeiraAula: primeira ? primeira.toISOString().slice(0, 10) : '',
      ultimaAula: ultima ? ultima.toISOString().slice(0, 10) : '',
      mesesDeCasa: Number(meses.toFixed(2)),
      aulasDadas,
      plano: '',
    });
  }

  linhas.sort((a, b) => Number(b.ativo) - Number(a.ativo) || b.mesesDeCasa - a.mesesDeCasa);
  const cols = ['id', 'nome', 'responsavel', 'ativo', 'reservas', 'reservasAtivas', 'primeiraAula', 'ultimaAula', 'mesesDeCasa', 'aulasDadas', 'plano'];
  console.log(cols.join(','));
  for (const l of linhas) console.log(cols.map((c) => csv(l[c])).join(','));

  const ativos = linhas.filter((l) => l.ativo);
  const inativos = linhas.filter((l) => !l.ativo);
  const soma = (arr) => arr.reduce((acc, l) => acc + l.mesesDeCasa, 0);
  const media = (arr) => (arr.length ? soma(arr) / arr.length : 0);
  const mediana = (arr) => {
    if (!arr.length) return 0;
    const v = arr.map((l) => l.mesesDeCasa).sort((a, b) => a - b);
    const m = Math.floor(v.length / 2);
    return v.length % 2 ? v[m] : (v[m - 1] + v[m]) / 2;
  };
  console.error('');
  console.error('===== RESUMO =====');
  console.error(`Alunos com reserva:            ${linhas.length}`);
  console.error(`Alunos ativos:                 ${ativos.length}`);
  console.error(`Soma meses de casa (ativos):   ${soma(ativos).toFixed(1)}`);
  console.error(`Média meses de casa (ativos):  ${media(ativos).toFixed(2)}  (mediana ${mediana(ativos).toFixed(2)})`);
  console.error(`Alunos inativos (churn):       ${inativos.length}`);
  console.error(`LTV realizado, média inativos: ${media(inativos).toFixed(2)} meses  (mediana ${mediana(inativos).toFixed(2)})`);
  console.error('');
  console.error('Leitura: "média de meses dos ativos" é o tempo de casa atual, que subestima o LTV');
  console.error('porque esses alunos ainda não saíram. "LTV realizado" usa só quem já saiu e');
  console.error('subestima também, se a base é jovem. O LTV real fica entre os dois e acima.');
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
