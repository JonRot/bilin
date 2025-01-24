const admin = require("firebase-admin/app");
admin.initializeApp();

const checkMessageContent = require("./check_message_content.js");
exports.checkMessageContent = checkMessageContent.checkMessageContent;
const enviarMensagemBoasVindas = require("./enviar_mensagem_boas_vindas.js");
exports.enviarMensagemBoasVindas =
  enviarMensagemBoasVindas.enviarMensagemBoasVindas;
