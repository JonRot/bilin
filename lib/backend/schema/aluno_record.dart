import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlunoRecord extends FirestoreRecord {
  AlunoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "teacherDoAluno" field.
  String? _teacherDoAluno;
  String get teacherDoAluno => _teacherDoAluno ?? '';
  bool hasTeacherDoAluno() => _teacherDoAluno != null;

  // "alunoNome" field.
  String? _alunoNome;
  String get alunoNome => _alunoNome ?? '';
  bool hasAlunoNome() => _alunoNome != null;

  // "alunoAulaTempo" field.
  DateTime? _alunoAulaTempo;
  DateTime? get alunoAulaTempo => _alunoAulaTempo;
  bool hasAlunoAulaTempo() => _alunoAulaTempo != null;

  // "alunoDescricao" field.
  String? _alunoDescricao;
  String get alunoDescricao => _alunoDescricao ?? '';
  bool hasAlunoDescricao() => _alunoDescricao != null;

  // "alunoMateria" field.
  String? _alunoMateria;
  String get alunoMateria => _alunoMateria ?? '';
  bool hasAlunoMateria() => _alunoMateria != null;

  // "alunoSex" field.
  String? _alunoSex;
  String get alunoSex => _alunoSex ?? '';
  bool hasAlunoSex() => _alunoSex != null;

  // "alunoIdade" field.
  String? _alunoIdade;
  String get alunoIdade => _alunoIdade ?? '';
  bool hasAlunoIdade() => _alunoIdade != null;

  // "requesterRole" field.
  Role? _requesterRole;
  Role? get requesterRole => _requesterRole;
  bool hasRequesterRole() => _requesterRole != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "alunoAlergia" field.
  String? _alunoAlergia;
  String get alunoAlergia => _alunoAlergia ?? '';
  bool hasAlunoAlergia() => _alunoAlergia != null;

  // "alunoFoto" field.
  String? _alunoFoto;
  String get alunoFoto => _alunoFoto ?? '';
  bool hasAlunoFoto() => _alunoFoto != null;

  // "alunoVaiEscola" field.
  String? _alunoVaiEscola;
  String get alunoVaiEscola => _alunoVaiEscola ?? '';
  bool hasAlunoVaiEscola() => _alunoVaiEscola != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _teacherDoAluno = snapshotData['teacherDoAluno'] as String?;
    _alunoNome = snapshotData['alunoNome'] as String?;
    _alunoAulaTempo = snapshotData['alunoAulaTempo'] as DateTime?;
    _alunoDescricao = snapshotData['alunoDescricao'] as String?;
    _alunoMateria = snapshotData['alunoMateria'] as String?;
    _alunoSex = snapshotData['alunoSex'] as String?;
    _alunoIdade = snapshotData['alunoIdade'] as String?;
    _requesterRole = deserializeEnum<Role>(snapshotData['requesterRole']);
    _userID = snapshotData['userID'] as DocumentReference?;
    _alunoAlergia = snapshotData['alunoAlergia'] as String?;
    _alunoFoto = snapshotData['alunoFoto'] as String?;
    _alunoVaiEscola = snapshotData['alunoVaiEscola'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('aluno')
          : FirebaseFirestore.instance.collectionGroup('aluno');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('aluno').doc(id);

  static Stream<AlunoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlunoRecord.fromSnapshot(s));

  static Future<AlunoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlunoRecord.fromSnapshot(s));

  static AlunoRecord fromSnapshot(DocumentSnapshot snapshot) => AlunoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlunoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlunoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlunoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlunoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlunoRecordData({
  String? teacherDoAluno,
  String? alunoNome,
  DateTime? alunoAulaTempo,
  String? alunoDescricao,
  String? alunoMateria,
  String? alunoSex,
  String? alunoIdade,
  Role? requesterRole,
  DocumentReference? userID,
  String? alunoAlergia,
  String? alunoFoto,
  String? alunoVaiEscola,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacherDoAluno': teacherDoAluno,
      'alunoNome': alunoNome,
      'alunoAulaTempo': alunoAulaTempo,
      'alunoDescricao': alunoDescricao,
      'alunoMateria': alunoMateria,
      'alunoSex': alunoSex,
      'alunoIdade': alunoIdade,
      'requesterRole': requesterRole,
      'userID': userID,
      'alunoAlergia': alunoAlergia,
      'alunoFoto': alunoFoto,
      'alunoVaiEscola': alunoVaiEscola,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlunoRecordDocumentEquality implements Equality<AlunoRecord> {
  const AlunoRecordDocumentEquality();

  @override
  bool equals(AlunoRecord? e1, AlunoRecord? e2) {
    return e1?.teacherDoAluno == e2?.teacherDoAluno &&
        e1?.alunoNome == e2?.alunoNome &&
        e1?.alunoAulaTempo == e2?.alunoAulaTempo &&
        e1?.alunoDescricao == e2?.alunoDescricao &&
        e1?.alunoMateria == e2?.alunoMateria &&
        e1?.alunoSex == e2?.alunoSex &&
        e1?.alunoIdade == e2?.alunoIdade &&
        e1?.requesterRole == e2?.requesterRole &&
        e1?.userID == e2?.userID &&
        e1?.alunoAlergia == e2?.alunoAlergia &&
        e1?.alunoFoto == e2?.alunoFoto &&
        e1?.alunoVaiEscola == e2?.alunoVaiEscola;
  }

  @override
  int hash(AlunoRecord? e) => const ListEquality().hash([
        e?.teacherDoAluno,
        e?.alunoNome,
        e?.alunoAulaTempo,
        e?.alunoDescricao,
        e?.alunoMateria,
        e?.alunoSex,
        e?.alunoIdade,
        e?.requesterRole,
        e?.userID,
        e?.alunoAlergia,
        e?.alunoFoto,
        e?.alunoVaiEscola
      ]);

  @override
  bool isValidKey(Object? o) => o is AlunoRecord;
}
