# Bilin Black Friday · 16/11 a 07/12/2026

Kit completo da campanha. Os arquivos prontos para usar estão em `entregaveis/`.

| Arquivo | Para quê |
|---|---|
| `1-estrategia-interna.pdf` | Apresentação para o time, em página única estilo landing page |
| `1-estrategia-interna-A4.pdf` | A mesma apresentação paginada em A4, para imprimir |
| `2-landing-page/index.html` | Página pública da campanha, arquivo único com formulários |
| `3-story-instagram-1-semana-gratis.png` | Story 1080x1920 para novos alunos e leads |
| `3-story-instagram-2-indique-e-ganhe.png` | Story 1080x1920 para quem já é Bilin |
| `4-arte-whatsapp-base.png` | Arte 1080x1350 para WhatsApp individual e grupo de recados |
| `5-email-base.html` / `.txt` | E-mail para a base, com opções de assunto e pré-cabeçalho |
| `5-email-logo.png` | Logo branco para o topo do e-mail |
| `6-whatsapp-texto.txt` | Texto com regras e instruções para enviar com a arte, versão curta e lembretes |

## Datas da campanha

| Data | O que acontece |
|---|---|
| 16/11 a 07/12 | Clientes indicam e acumulam aulas: 5 = 1, 10 = 2, 15 = 4, 20 = 6. Vale o indicado que preencher o cadastro |
| 16/11 a 07/12 | Novos alunos que fecham ganham 1 semana de aulas grátis |
| 27/11 | Dia Bilin Black Friday |
| 14/12 | Resultado final das indicações |
| 15/12/2026 a 30/06/2027 | Uso das aulas grátis, direto nas aulas normais |

## Antes de publicar

1. **Número de WhatsApp.** Já configurado com o número do site, 5548992105010, na landing page e no e-mail. Se mudar, troque no bloco `CONFIG` no fim de `src/landing.html` e no e-mail, e rode o build de novo.
2. **Links do e-mail e do WhatsApp.** Já apontam para https://ensinobilin.com/black-friday/. No e-mail, suba `5-email-logo.png` na ferramenta de envio e troque `{{URL_LOGO}}` pelo endereço da imagem.
3. **Teste no celular.** Abra https://ensinobilin.com/black-friday/, preencha o formulário e confira se a mensagem chega no WhatsApp da Bilin.

## Onde a landing page está publicada

A página vive no repositório do site (JonRot/bilin-site), em `black-friday/index.html`, e é servida em https://ensinobilin.com/black-friday/. O arquivo em `entregaveis/2-landing-page/` é a versão avulsa, com fonte e imagens embutidas, caso precise ser hospedada em outro lugar.

## Como publicar a landing page numa aba do sistema

A página é um HTML único, sem dependência de servidor. Duas etapas:

1. **Hospedar o arquivo.** Qualquer hospedagem estática serve. No Firebase Hosting do projeto, use um site separado para não sobrescrever o site atual:

   ```
   firebase hosting:sites:create bilin-black-friday
   ```

   Depois publique só a pasta `entregaveis/2-landing-page` nesse site. Não rode `firebase deploy --only hosting` no site padrão sem conferir o que está publicado lá.

2. **Criar a aba no app.** No FlutterFlow, crie uma página "Black Friday" no menu com um widget WebView apontando para a URL publicada. Outra opção é um botão com a ação Launch URL.

## Identidade visual

Tudo segue o Mini Manual de Identidade Visual da pasta de comunicação da Bilin no Drive.

- **Logo:** marca principal sem brilho, versão branca em fundo escuro e versão preta em fundo claro.
- **Cores:** coral `#F69897`, grafite `#333132`, creme `#F9F2EB` e bege `#E5D8CC`, com a paleta secundária nos destaques.
- **Fonte:** Poligrapher Grotesk, embutida na landing page, no PDF e nas artes. O e-mail usa Helvetica ou Arial, porque os programas de e-mail não carregam fontes próprias.
- **Elementos:** a mala B e as formas complementares, que estão em `assets/`.

Antes de publicar a landing page, confirme que a licença da Poligrapher Grotesk permite uso na web.

## Como alterar textos, datas ou artes

Os originais estão em `src/`. Depois de editar, gere tudo de novo:

```
cd marketing/bilin-black-friday
NODE_PATH=$(npm root -g) node build.js
```

O build usa Playwright com Chromium e embute a fonte da marca a partir de `assets/fonts`. A landing page carrega as fontes do Google Fonts sozinha.

Se a campanha mudar de mês, as datas aparecem em todos os arquivos de `src/`, no e-mail e no texto de WhatsApp. Procure por `16/11`, `27/11`, `07/12`, `14/12`, `15/12`, `30/06` e `15/01`. No sistema, as datas ficam na constante `BF2026` (Bilin-BMAD, `src/constants/referral-campaign.ts`). Datas anteriores (campanha de outubro) foram trocadas em 06/11/2026.
