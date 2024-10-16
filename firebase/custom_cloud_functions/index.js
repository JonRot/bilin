const admin = require("firebase-admin/app");
admin.initializeApp();

const checkMessageContent = require("./check_message_content.js");
exports.checkMessageContent = checkMessageContent.checkMessageContent;
