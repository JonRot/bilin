import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilin/providers/app_state.dart';

class ErrorDialogListener extends StatefulWidget {
  final Widget child;

  const ErrorDialogListener({super.key, required this.child});

  @override
  State<ErrorDialogListener> createState() => _ErrorListenerState();
}

class _ErrorListenerState extends State<ErrorDialogListener> {
  String? _lastError;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        // Check if there's a new error to display
        if (appState.errorMessage != null && 
            appState.errorMessage != _lastError &&
            appState.errorMessage!.isNotEmpty) {
          
          _lastError = appState.errorMessage;
          
          // Show error dialog after the current frame
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _showErrorDialog(context, appState.errorMessage!);
            }
          });
        }

        return widget.child;
      },
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(width: 8),
              const Text('Error'),
            ],
          ),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Clear the error after showing it
                context.read<AppState>().clearError();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}