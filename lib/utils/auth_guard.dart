import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilin/providers/app_state.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;
  final Widget Function()? unauthenticatedBuilder;
  final List<String>? requiredRoles;

  const AuthGuard({
    super.key,
    required this.child,
    this.unauthenticatedBuilder,
    this.requiredRoles,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        // Check if user is authenticated
        if (!appState.isAuthenticated) {
          if (unauthenticatedBuilder != null) {
            return unauthenticatedBuilder!();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Check role requirements
        if (requiredRoles != null && 
            requiredRoles!.isNotEmpty && 
            appState.userRole != null &&
            !requiredRoles!.contains(appState.userRole)) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Access Denied'),
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.block,
                    size: 64,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'You do not have permission to access this page.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return child;
      },
    );
  }
}

// Helper widget for loading states
class LoadingWrapper extends StatelessWidget {
  final Widget child;

  const LoadingWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return Stack(
          children: [
            child,
            if (appState.isLoading)
              Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Loading...'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

// Helper widget for error messages
class ErrorSnackbar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }
}

class ErrorListener extends StatefulWidget {
  final Widget child;

  const ErrorListener({super.key, required this.child});

  @override
  State<ErrorListener> createState() => _ErrorListenerState();
}

class _ErrorListenerState extends State<ErrorListener> {
  String? _lastError;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        // Show error if it's new
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (appState.errorMessage != null && 
              appState.errorMessage != _lastError) {
            _lastError = appState.errorMessage;
            ErrorSnackbar.show(context, appState.errorMessage!);
          }
        });

        return widget.child;
      },
    );
  }
}