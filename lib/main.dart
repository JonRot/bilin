import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bilin/theme.dart';
import 'package:bilin/providers/app_state.dart';
import 'package:bilin/utils/auth_guard.dart';
import 'package:bilin/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  
  runApp(const BilinApp());
}

class BilinApp extends StatelessWidget {
  const BilinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return MaterialApp(
            title: 'Bilin - Tutoring Platform',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            home: ErrorListener(
              child: LoadingWrapper(
                child: const SplashPage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
