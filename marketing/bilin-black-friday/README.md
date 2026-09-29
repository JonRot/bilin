# Bilin Black Friday · Outubro 2026

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
| `6-whatsapp-texto.txt` | Texto com regras e instruções para enviar com a arte, versão curta e lembretes |

## Datas da campanha

| Data | O que acontece |
|---|---|
| 01/10 a 31/10 | Clientes indicam e acumulam aulas: 5 = 1, 10 = 2, 15 = 4, 20 = 6 |
| 23/10 a 06/11 | Novos alunos que fecham ganham 1 semana de aulas grátis |
| 30/10 | Dia Bilin Black Friday |
| 10/11 | Resultado final das indicações |
| 16/11 a 30/04/2027 | Uso das aulas grátis |

## Antes de publicar

1. **Número de WhatsApp.** Na landing page, troque `5500000000000` pelo número da Bilin com DDI e DDD, só dígitos. Fica no bloco `CONFIG` no fim de `src/landing.html`. Depois rode o build de novo.
2. **Links do e-mail e do WhatsApp.** Troque `{{LINK_LANDING}}` pelo endereço da landing page e `{{LINK_WHATSAPP}}` por `https://wa.me/<número>`.
3. **Teste no celular.** Abra a landing page, preencha o formulário e confira se a mensagem chega no WhatsApp da Bilin.

## Como publicar a landing page numa aba do sistema

A página é um HTML único, sem dependência de servidor. Duas etapas:

1. **Hospedar o arquivo.** Qualquer hospedagem estática serve. No Firebase Hosting do projeto, use um site separado para não sobrescrever o site atual:

   ```
   firebase hosting:sites:create bilin-black-friday
   ```

   Depois publique só a pasta `entregaveis/2-landing-page` nesse site. Não rode `firebase deploy --only hosting` no site padrão sem conferir o que está publicado lá.

2. **Criar a aba no app.** No FlutterFlow, crie uma página "Black Friday" no menu com um widget WebView apontando para a URL publicada. Outra opção é um botão com a ação Launch URL.

## Como alterar textos, datas ou artes

Os originais estão em `src/`. Depois de editar, gere tudo de novo:

```
cd marketing/bilin-black-friday
NODE_PATH=$(npm root -g) node build.js
```

O build usa Playwright com Chromium. As fontes Fraunces e DM Sans precisam estar instaladas no sistema para as artes e o PDF saírem com a tipografia certa. A landing page carrega as fontes do Google Fonts sozinha.

Se a campanha mudar de mês, as datas aparecem em todos os arquivos de `src/`, no e-mail e no texto de WhatsApp. Procure por `01/10`, `31/10`, `23/10`, `30/10`, `06/11`, `10/11`, `16/11` e `30/04`.
