const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

exports.checkMessageContent = functions
  .region("southamerica-east1") // Ensure the function runs in the South America region
  .firestore.document("chat_messages/{messageId}")
  .onCreate(async (snap, context) => {
    try {
      const messageData = snap.data();
      const messageText = messageData.text.toLowerCase(); // Access the "text" field in lowercase

      // Define keyword categories
      const keywords = {
        phone: [
          "celular",
          "telefone",
          "número",
          "whatsapp",
          "wpp",
          "zap",
          "contato",
        ],
        email: [
          "e-mail",
          "gmail",
          "yahoo",
          "hotmail",
          "protonmail",
          "enviar e-mail",
        ],
        social: [
          "facebook",
          "instagram",
          "twitter",
          "tiktok",
          "perfil",
          "arroba",
          "dm",
        ],
        platformDeviation: [
          "por fora",
          "falar por fora",
          "falar diretamente",
          "conversar em privado",
          "fora do app",
          "me chama no",
        ],
        messagingApps: [
          "whatsapp",
          "telegram",
          "signal",
          "messenger",
          "viber",
          "skype",
          "sms",
        ],
        security: [
          "confidencial",
          "privado",
          "seguro",
          "dados pessoais",
          "senha",
          "fraude",
          "scam",
        ],
        payment: [
          "pix",
          "transferência bancária",
          "depósito",
          "pagar por fora",
          "dinheiro em mãos",
        ],
      };

      // Ensure all keywords are lowercase
      const allKeywords = []
        .concat(...Object.values(keywords))
        .map((keyword) => keyword.toLowerCase());

      // Check if any keyword is found in the message text
      const foundKeywords = allKeywords.filter((keyword) =>
        messageText.includes(keyword),
      );

      if (foundKeywords.length > 0) {
        console.log(`Keywords found: ${foundKeywords}`);

        // Add a notification to Firestore
        await admin.firestore().collection("notifications").add({
          messageId: context.params.messageId,
          detectedKeywords: foundKeywords,
          messageText: messageText,
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });
      }

      return null; // Function executed successfully
    } catch (error) {
      console.error("Error processing message content:", error);
      return null; // Return null if any error occurs
    }
  });
