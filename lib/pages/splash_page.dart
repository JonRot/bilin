import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilin/providers/app_state.dart';
import 'package:bilin/pages/auth/welcome_page.dart';
import 'package:bilin/pages/admin/admin_dashboard_page.dart';
import 'package:bilin/widgets/navigation/parent_navigation.dart';
import 'package:bilin/widgets/navigation/teacher_navigation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final appState = context.read<AppState>();
    await appState.initializeAppState();
    
    if (mounted) {
      _navigateToAppropriatePage();
    }
  }

  void _navigateToAppropriatePage() {
    final appState = context.read<AppState>();
    
    Widget nextPage;
    
    if (!appState.isAuthenticated) {
      nextPage = const WelcomePage();
    } else {
      switch (appState.userRole) {
        case 'parent':
          nextPage = const ParentNavigation();
          break;
        case 'teacher':
          nextPage = const TeacherNavigation();
          break;
        case 'admin':
          nextPage = const AdminDashboardPage();
          break;
        default:
          nextPage = const WelcomePage();
      }
    }
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo placeholder
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                Icons.school,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Bilin',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Connecting students with language teachers',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.8),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}