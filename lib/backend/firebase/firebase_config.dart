import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDHzSIYa_3inseqUJHRZ8l_3urMZ8xIBB8",
            authDomain: "ensino-bilingue.firebaseapp.com",
            projectId: "ensino-bilingue",
            storageBucket: "ensino-bilingue.appspot.com",
            messagingSenderId: "743693361963",
            appId: "1:743693361963:web:3475cfe7b9d38b50281b6e",
            measurementId: "G-L0LHPGD2CZ"));
  } else {
    await Firebase.initializeApp();
  }
}
