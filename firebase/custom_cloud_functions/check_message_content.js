const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

// Function to normalize text by removing special characters and accents
const normalizeText = (text) => {
  return text
    .normalize("NFD") // Decompose accents
    .replace(/\p{Diacritic}/gu, "") // Remove diacritical marks
    .toLowerCase(); // Convert to lowercase
};

exports.checkMessageContent = functions
  .region("southamerica-east1") // Ensure the function runs in the South America region
  .firestore.document("chat_messages/{messageId}")
  .onCreate(async (snap, context) => {
    try {
      const messageData = snap.data();
      console.log("Message data:", messageData);

      // Access the text and user fields
      const messageText = messageData.text
        ? normalizeText(messageData.text)
        : "";
      const userRef = messageData.user; // Reference to the user document
      const chatRef = messageData.chat; // Reference to the related chat document (if available)

      if (!chatRef) {
        console.error("Chat reference is missing in the message document");
        return null;
      }

      console.log("Chat reference:", chatRef.path);

      // Define extensive keyword mappings with variations
      const keywordMappings = {
        phone: [
          "celular",
          "telefone",
          "numero",
          "contato",
          "fone",
          "phone",
          "mobile",
          "mob",
          "tel",
        ],
        email: [
          "e-mail",
          "gmail",
          "yahoo",
          "hotmail",
          "protonmail",
          "enviar email",
          "email",
          "mail",
          "outlook",
        ],
        social: [
          "facebook",
          "instagram",
          "twitter",
          "tiktok",
          "perfil",
          "arroba",
          "dm",
          "linkedin",
          "snapchat",
          "snap",
          "ig",
          "fb",
          "meta",
          "threads",
          "pagina",
          "canal",
        ],
        platformDeviation: [
          "por fora",
          "falar por fora",
          "falar diretamente",
          "conversar em privado",
          "fora do app",
          "me chama no",
          "privado",
          "por aqui nao",
          "fora daqui",
          "alternativo",
          "outra plataforma",
        ],
        messagingApps: [
          "whatsapp",
          "wpp",
          "zap",
          "whats",
          "wats",
          "telegram",
          "signal",
          "messenger",
          "viber",
          "skype",
          "sms",
          "kik",
          "chat",
          "mensagem",
          "msg",
          "msgn",
          "inbox",
        ],
        security: [
          "confidencial",
          "privado",
          "seguro",
          "dados pessoais",
          "senha",
          "fraude",
          "scam",
          "hack",
          "phishing",
          "roubo de dados",
          "sigilo",
          "violacao",
          "privacidade",
          "seguranca",
          "protegido",
        ],
        payment: [
          "pix",
          "transferencia bancaria",
          "deposito",
          "pagar por fora",
          "dinheiro em maos",
          "boleto",
          "cartao",
          "pagamento",
          "cash",
          "money",
          "rs",
          "dolar",
          "euro",
          "paypal",
          "pagseguro",
          "pagar",
        ],
      };

      // Generate a flat and deduplicated keyword list
      const allKeywords = Array.from(
        new Set(
          []
            .concat(...Object.values(keywordMappings))
            .map((keyword) => normalizeText(keyword)),
        ),
      );

      console.log("All Keywords:", allKeywords);

      // Check for matching keywords in the message text
      const foundKeywords = allKeywords.filter((keyword) =>
        messageText.includes(keyword),
      );
      console.log("Found keywords:", foundKeywords);

      if (foundKeywords.length > 0) {
        console.log("Adding notification...");
        // Add a notification document with relevant information
        await admin.firestore().collection("notifications").add({
          messageId: context.params.messageId,
          chatRef: chatRef, // Store the Document Reference to the chat document
          senderRef: userRef, // Store the Document Reference to the user's document
          detectedKeywords: foundKeywords,
          messageText: messageText,
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });
        console.log("Notification added successfully");
      }

      return null;
    } catch (error) {
      console.error("Error processing message content:", error);
      return null;
    }
  });
