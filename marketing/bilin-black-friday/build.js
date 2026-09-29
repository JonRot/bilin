/**
 * Gera os entregáveis finais da Bilin Black Friday a partir de src/.
 *
 *   NODE_PATH=$(npm root -g) node build.js
 *
 * - Landing page: embute os logos (data URI) e grava um HTML único em entregaveis/.
 * - PDF da estratégia: página única estilo landing page + versão A4 para impressão.
 * - Artes: story 1080x1920 e WhatsApp 1080x1350 em PNG.
 * Para mudar datas ou textos, edite os arquivos em src/ e rode de novo.
 */
const fs = require('fs');
const path = require('path');
const { chromium } = require('playwright');

const ROOT = __dirname;
const SRC = path.join(ROOT, 'src');
const OUT = path.join(ROOT, 'entregaveis');

function inline(file) {
  let html = fs.readFileSync(path.join(SRC, file), 'utf8');
  html = html.replace('/*@fonts*/', fs.readFileSync(path.join(SRC, '_fonts.css'), 'utf8'));
  return html.replace(/(["'(])\.\.\/assets\/([\w./-]+\.(png|ttf))/g, (_, q, name, ext) => {
    const b64 = fs.readFileSync(path.join(ROOT, 'assets', name)).toString('base64');
    const mime = ext === 'ttf' ? 'font/ttf' : 'image/png';
    return `${q}data:${mime};base64,${b64}`;
  });
}

async function open(browser, html, width, height) {
  const page = await browser.newPage({ viewport: { width, height }, deviceScaleFactor: 1 });
  await page.setContent(html, { waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  return page;
}

(async () => {
  fs.mkdirSync(OUT, { recursive: true });
  const browser = await chromium.launch({ executablePath: process.env.CHROMIUM || '/opt/pw-browsers/chromium-1194/chrome-linux/chrome' });

  // 1. Landing page (arquivo único)
  fs.mkdirSync(path.join(OUT, '2-landing-page'), { recursive: true });
  fs.writeFileSync(path.join(OUT, '2-landing-page', 'index.html'), inline('landing.html'));

  // 2. Estratégia interna em PDF
  if (fs.existsSync(path.join(SRC, 'estrategia.html'))) {
    const html = inline('estrategia.html');
    const page = await open(browser, html, 1000, 1200);
    const h = await page.evaluate(() => document.documentElement.scrollHeight);
    await page.pdf({ path: path.join(OUT, '1-estrategia-interna.pdf'), width: '1000px', height: `${h + 2}px`, printBackground: true, pageRanges: '1' });
    await page.emulateMedia({ media: 'print' });
    await page.pdf({ path: path.join(OUT, '1-estrategia-interna-A4.pdf'), format: 'A4', printBackground: true, scale: 0.72, margin: { top: '0', bottom: '0', left: '0', right: '0' } });
    await page.close();
  }

  // 3. Artes
  const arts = [
    ['story-novos.html', '3-story-instagram-1-semana-gratis.png', 1080, 1920],
    ['story-base.html', '3-story-instagram-2-indique-e-ganhe.png', 1080, 1920],
    ['whatsapp-base.html', '4-arte-whatsapp-base.png', 1080, 1350],
  ];
  for (const [src, out, w, h] of arts) {
    if (!fs.existsSync(path.join(SRC, src))) continue;
    const page = await open(browser, inline(src), w, h);
    await page.screenshot({ path: path.join(OUT, out), clip: { x: 0, y: 0, width: w, height: h } });
    await page.close();
  }

  // prévias para conferência visual (não são entregáveis)
  if (process.env.PREVIEW) {
    const dir = process.env.PREVIEW;
    fs.mkdirSync(dir, { recursive: true });
    for (const [w, name] of [[390, 'landing-mobile.png'], [1280, 'landing-desktop.png']]) {
      const page = await open(browser, inline('landing.html'), w, 900);
      await page.screenshot({ path: path.join(dir, name), fullPage: true });
      await page.close();
    }
    if (fs.existsSync(path.join(SRC, 'estrategia.html'))) {
      const page = await open(browser, inline('estrategia.html'), 1000, 1200);
      await page.screenshot({ path: path.join(dir, 'estrategia.png'), fullPage: true });
      await page.close();
    }
  }
  await browser.close();
  console.log('ok');
})().catch((e) => { console.error(e); process.exit(1); });
