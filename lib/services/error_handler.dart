import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Centralized error handling service
class ErrorHandler {
  static void logError(String context, dynamic error, [StackTrace? stackTrace]) {
    if (kDebugMode) {
      print('Error in $context: $error');
      if (stackTrace != null) {
        print('Stack trace: $stackTrace');
      }
    }
    
    // In production, you could send errors to a logging service like Crashlytics
    // FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: false);
  }

  static String getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return _getAuthErrorMessage(error);
    } else if (error is FirebaseException) {
      return _getFirestoreErrorMessage(error);
    } else if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  static String _getAuthErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email address is already registered.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'Invalid email address format.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'Authentication error: ${error.message ?? 'Unknown error'}';
    }
  }

  static String _getFirestoreErrorMessage(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return 'You don\'t have permission to perform this action.';
      case 'not-found':
        return 'The requested document was not found.';
      case 'already-exists':
        return 'The document already exists.';
      case 'resource-exhausted':
        return 'Service quota exceeded. Please try again later.';
      case 'failed-precondition':
        return 'The operation failed due to a precondition check.';
      case 'aborted':
        return 'The operation was aborted due to a conflict.';
      case 'out-of-range':
        return 'The operation was attempted past the valid range.';
      case 'unimplemented':
        return 'This operation is not implemented or supported.';
      case 'internal':
        return 'Internal server error. Please try again.';
      case 'unavailable':
        return 'Service is currently unavailable. Please try again.';
      case 'data-loss':
        return 'Unrecoverable data loss or corruption.';
      case 'unauthenticated':
        return 'You need to be signed in to perform this action.';
      case 'deadline-exceeded':
        return 'Operation timed out. Please try again.';
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'invalid-argument':
        return 'Invalid input provided.';
      default:
        return 'Database error: ${error.message ?? 'Unknown error'}';
    }
  }

  static bool isNetworkError(dynamic error) {
    if (error is FirebaseException) {
      return error.code == 'unavailable' || 
             error.code == 'deadline-exceeded' ||
             error.code == 'network-request-failed';
    }
    return false;
  }

  static bool isPermissionError(dynamic error) {
    if (error is FirebaseException) {
      return error.code == 'permission-denied' || 
             error.code == 'unauthenticated';
    }
    return false;
  }

  static bool isRetryableError(dynamic error) {
    if (error is FirebaseException) {
      return ['unavailable', 'deadline-exceeded', 'internal', 'aborted'].contains(error.code);
    }
    return false;
  }
}

// Loading state management
enum LoadingState {
  idle,
  loading,
  success,
  error,
}

class LoadingStateManager extends ChangeNotifier {
  LoadingState _state = LoadingState.idle;
  String? _errorMessage;
  dynamic _data;

  LoadingState get state => _state;
  String? get errorMessage => _errorMessage;
  dynamic get data => _data;
  
  bool get isLoading => _state == LoadingState.loading;
  bool get hasError => _state == LoadingState.error;
  bool get isSuccess => _state == LoadingState.success;
  bool get isIdle => _state == LoadingState.idle;

  void setLoading() {
    _state = LoadingState.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void setSuccess([dynamic data]) {
    _state = LoadingState.success;
    _errorMessage = null;
    _data = data;
    notifyListeners();
  }

  void setError(String message, [dynamic error]) {
    _state = LoadingState.error;
    _errorMessage = message;
    _data = null;
    ErrorHandler.logError('LoadingStateManager', error);
    notifyListeners();
  }

  void setIdle() {
    _state = LoadingState.idle;
    _errorMessage = null;
    _data = null;
    notifyListeners();
  }

  void reset() {
    setIdle();
  }
}

// Async operation wrapper with error handling
class AsyncOperation {
  static Future<T?> execute<T>(
    Future<T> Function() operation, {
    String context = 'Operation',
    LoadingStateManager? loadingManager,
    bool showLoading = true,
    int maxRetries = 0,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    if (showLoading && loadingManager != null) {
      loadingManager.setLoading();
    }

    int attempts = 0;
    dynamic lastError;

    while (attempts <= maxRetries) {
      try {
        final result = await operation();
        
        if (loadingManager != null) {
          loadingManager.setSuccess(result);
        }
        
        return result;
      } catch (error, stackTrace) {
        attempts++;
        lastError = error;
        
        ErrorHandler.logError('$context (attempt $attempts)', error, stackTrace);
        
        // Check if we should retry
        if (attempts <= maxRetries && ErrorHandler.isRetryableError(error)) {
          await Future.delayed(retryDelay);
          continue;
        }
        
        // No more retries or non-retryable error
        final errorMessage = ErrorHandler.getErrorMessage(error);
        
        if (loadingManager != null) {
          loadingManager.setError(errorMessage, error);
        }
        
        break;
      }
    }

    return null;
  }
}

// Result wrapper for operations that can fail
abstract class OperationResult<T> {
  const OperationResult();
  
  bool get isSuccess;
  bool get isFailure;
  T? get data;
  String? get errorMessage;
  dynamic get error;
  
  R when<R>({
    required R Function(T data) success,
    required R Function(String message, dynamic error) failure,
  });
}

class SuccessResult<T> extends OperationResult<T> {
  final T _data;
  
  const SuccessResult(this._data);
  
  @override
  bool get isSuccess => true;
  
  @override
  bool get isFailure => false;
  
  @override
  T get data => _data;
  
  @override
  String? get errorMessage => null;
  
  @override
  dynamic get error => null;
  
  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(String message, dynamic error) failure,
  }) {
    return success(_data);
  }
}

class FailureResult<T> extends OperationResult<T> {
  final String _message;
  final dynamic _error;
  
  const FailureResult(this._message, [this._error]);
  
  @override
  bool get isSuccess => false;
  
  @override
  bool get isFailure => true;
  
  @override
  T? get data => null;
  
  @override
  String get errorMessage => _message;
  
  @override
  dynamic get error => _error;
  
  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(String message, dynamic error) failure,
  }) {
    return failure(_message, _error);
  }
}

// Extension to convert Future<T> to Future<OperationResult<T>>
extension FutureToResult<T> on Future<T> {
  Future<OperationResult<T>> toResult({String context = 'Operation'}) async {
    try {
      final result = await this;
      return SuccessResult(result);
    } catch (error, stackTrace) {
      ErrorHandler.logError(context, error, stackTrace);
      final message = ErrorHandler.getErrorMessage(error);
      return FailureResult(message, error);
    }
  }
}