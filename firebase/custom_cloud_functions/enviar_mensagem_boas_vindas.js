const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.enviarMensagemBoasVindas = functions
  .region("southamerica-east1")
  .https.onCall(async (data, context) => {
    const userId = data.userId || context.auth?.uid;
    const atendimentoUserId = "atendimento@ensinobilin.com"; // Substitua pelo ID real do usuário atendimento

    try {
      // Referência ao documento do chat
      const chatRef = admin
        .firestore()
        .collection("chats")
        .doc(`${userId}_${atendimentoUserId}`);

      const mensagemBoasVindas = {
        sender: atendimentoUserId,
        recipient: userId,
        message:
          "Bem-vindo à nossa plataforma! Fique à vontade para nos procurar aqui com qualquer dúvida.",
        timestamp: admin.firestore.FieldValue.serverTimestamp(),
        type: "text",
      };

      // Adicionar a mensagem de boas-vindas na subcoleção 'messages'
      const messageRef = await chatRef
        .collection("messages")
        .add(mensagemBoasVindas);

      // Atualizar o documento do chat principal com informações completas
      await chatRef.set(
        {
          group_chat_id: `${userId}_${atendimentoUserId}`, // ID único do grupo
          last_message: mensagemBoasVindas.message, // Última mensagem enviada
          last_message_time: admin.firestore.FieldValue.serverTimestamp(), // Timestamp da última mensagem
          last_message_sent_by: atendimentoUserId, // Usuário que enviou a última mensagem
          last_message_seen_by: [], // Inicializa como vazio (visto por nenhum usuário)
          user_a: `/users/${userId}`, // Referência ao usuário
          user_b: `/users/${atendimentoUserId}`, // Referência ao atendimento
          users: [`/users/${userId}`, `/users/${atendimentoUserId}`], // Array de usuários
        },
        { merge: true },
      );

      console.log(
        "Mensagem de boas-vindas enviada com sucesso para o usuário:",
        userId,
      );
      return { success: true, message: "Mensagem de boas-vindas enviada." };
    } catch (error) {
      console.error("Erro ao enviar mensagem de boas-vindas:", error);
      return {
        success: false,
        error: "Erro ao enviar mensagem de boas-vindas.",
      };
    }
  });
