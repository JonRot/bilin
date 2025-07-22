import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bilin/services/firestore_repository.dart';
import 'package:bilin/services/error_handler.dart';
import 'package:bilin/data_schema.dart';

// Main service class that provides high-level business logic
class BilinService extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  final LoadingStateManager _loadingManager = LoadingStateManager();
  
  LoadingStateManager get loadingManager => _loadingManager;
  
  // User Management
  Future<OperationResult<UserModel?>> getUserByEmail(String email) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.users.getUserByEmail(email);
        if (result is FirestoreSuccess<UserModel?>) {
          return result.data;
        } else if (result is FirestoreFailure<UserModel?>) {
          throw Exception(result.message);
        }
        return null;
      },
      context: 'getUserByEmail',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('User not found')
    );
  }
  
  Future<OperationResult<String>> createUser(UserModel user) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.users.create(user);
        if (result is FirestoreSuccess<DocumentReference>) {
          return result.data.id;
        } else if (result is FirestoreFailure<DocumentReference>) {
          throw Exception(result.message);
        }
        throw Exception('Unknown error creating user');
      },
      context: 'createUser',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to create user')
    );
  }
  
  // Student Management
  Future<OperationResult<List<StudentModel>>> getStudentsByParent(DocumentReference parentRef) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.students.getStudentsByParent(parentRef);
        if (result is FirestoreSuccess<List<StudentModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<StudentModel>>) {
          throw Exception(result.message);
        }
        return <StudentModel>[];
      },
      context: 'getStudentsByParent',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get students')
    );
  }
  
  Future<OperationResult<String>> createStudent(StudentModel student) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.students.create(student);
        if (result is FirestoreSuccess<DocumentReference>) {
          return result.data.id;
        } else if (result is FirestoreFailure<DocumentReference>) {
          throw Exception(result.message);
        }
        throw Exception('Unknown error creating student');
      },
      context: 'createStudent',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to create student')
    );
  }
  
  // Teacher Management
  Future<OperationResult<List<TeacherProfileModel>>> getAvailableTeachers({
    String? language,
    DocumentReference? locationRef,
    double? minRate,
    double? maxRate,
  }) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.teachers.getApprovedTeachers(
          language: language,
          locationRef: locationRef,
          minRate: minRate,
          maxRate: maxRate,
        );
        if (result is FirestoreSuccess<List<TeacherProfileModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<TeacherProfileModel>>) {
          throw Exception(result.message);
        }
        return <TeacherProfileModel>[];
      },
      context: 'getAvailableTeachers',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get teachers')
    );
  }
  
  Future<OperationResult<TeacherProfileModel?>> getTeacherProfile(DocumentReference userRef) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.teachers.getTeacherByUserRef(userRef);
        if (result is FirestoreSuccess<TeacherProfileModel?>) {
          return result.data;
        } else if (result is FirestoreFailure<TeacherProfileModel?>) {
          throw Exception(result.message);
        }
        return null;
      },
      context: 'getTeacherProfile',
      loadingManager: _loadingManager,
    ).then((data) => SuccessResult(data));
  }
  
  Future<OperationResult<String>> createTeacherProfile(TeacherProfileModel teacher) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.teachers.create(teacher);
        if (result is FirestoreSuccess<DocumentReference>) {
          return result.data.id;
        } else if (result is FirestoreFailure<DocumentReference>) {
          throw Exception(result.message);
        }
        throw Exception('Unknown error creating teacher profile');
      },
      context: 'createTeacherProfile',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to create teacher profile')
    );
  }
  
  // Lesson Management
  Future<OperationResult<List<LessonModel>>> getLessonsByStudent(
    DocumentReference studentRef, {
    String? status,
  }) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.lessons.getLessonsByStudent(
          studentRef,
          status: status,
        );
        if (result is FirestoreSuccess<List<LessonModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<LessonModel>>) {
          throw Exception(result.message);
        }
        return <LessonModel>[];
      },
      context: 'getLessonsByStudent',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get lessons')
    );
  }
  
  Future<OperationResult<List<LessonModel>>> getLessonsByTeacher(
    DocumentReference teacherRef, {
    String? status,
  }) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.lessons.getLessonsByTeacher(
          teacherRef,
          status: status,
        );
        if (result is FirestoreSuccess<List<LessonModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<LessonModel>>) {
          throw Exception(result.message);
        }
        return <LessonModel>[];
      },
      context: 'getLessonsByTeacher',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get lessons')
    );
  }
  
  Future<OperationResult<String>> createLesson(LessonModel lesson) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.lessons.create(lesson);
        if (result is FirestoreSuccess<DocumentReference>) {
          return result.data.id;
        } else if (result is FirestoreFailure<DocumentReference>) {
          throw Exception(result.message);
        }
        throw Exception('Unknown error creating lesson');
      },
      context: 'createLesson',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to create lesson')
    );
  }
  
  Future<OperationResult<void>> updateLessonStatus(String lessonId, String status) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.lessons.updateLessonStatus(lessonId, status);
        if (result is FirestoreSuccess<void>) {
          return;
        } else if (result is FirestoreFailure<void>) {
          throw Exception(result.message);
        }
      },
      context: 'updateLessonStatus',
      loadingManager: _loadingManager,
    ).then((data) => const SuccessResult(null));
  }
  
  // Payment Management
  Future<OperationResult<List<PaymentModel>>> getPendingPayments() async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.payments.getPendingPayments();
        if (result is FirestoreSuccess<List<PaymentModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<PaymentModel>>) {
          throw Exception(result.message);
        }
        return <PaymentModel>[];
      },
      context: 'getPendingPayments',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get pending payments')
    );
  }
  
  Future<OperationResult<void>> markPaymentCompleted(String paymentId, String transactionId) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.payments.markPaymentCompleted(paymentId, transactionId);
        if (result is FirestoreSuccess<void>) {
          return;
        } else if (result is FirestoreFailure<void>) {
          throw Exception(result.message);
        }
      },
      context: 'markPaymentCompleted',
      loadingManager: _loadingManager,
    ).then((data) => const SuccessResult(null));
  }
  
  // Location Management
  Future<OperationResult<List<LocationModel>>> getLocationsByUser(DocumentReference userRef) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.locations.getLocationsByUser(userRef);
        if (result is FirestoreSuccess<List<LocationModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<LocationModel>>) {
          throw Exception(result.message);
        }
        return <LocationModel>[];
      },
      context: 'getLocationsByUser',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get locations')
    );
  }
  
  Future<OperationResult<String>> createLocation(LocationModel location) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.locations.create(location);
        if (result is FirestoreSuccess<DocumentReference>) {
          return result.data.id;
        } else if (result is FirestoreFailure<DocumentReference>) {
          throw Exception(result.message);
        }
        throw Exception('Unknown error creating location');
      },
      context: 'createLocation',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to create location')
    );
  }
  
  // Progress Report Management
  Future<OperationResult<List<ProgressReportModel>>> getProgressReportsByLesson(DocumentReference lessonRef) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.progressReports.getReportsByLesson(lessonRef);
        if (result is FirestoreSuccess<List<ProgressReportModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<ProgressReportModel>>) {
          throw Exception(result.message);
        }
        return <ProgressReportModel>[];
      },
      context: 'getProgressReportsByLesson',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get progress reports')
    );
  }
  
  Future<OperationResult<String>> createProgressReport(ProgressReportModel report) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.progressReports.create(report);
        if (result is FirestoreSuccess<DocumentReference>) {
          return result.data.id;
        } else if (result is FirestoreFailure<DocumentReference>) {
          throw Exception(result.message);
        }
        throw Exception('Unknown error creating progress report');
      },
      context: 'createProgressReport',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to create progress report')
    );
  }
  
  // Admin Functions
  Future<OperationResult<Map<String, int>>> getDashboardStats() async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.getDashboardStats();
        if (result is FirestoreSuccess<Map<String, int>>) {
          return result.data;
        } else if (result is FirestoreFailure<Map<String, int>>) {
          throw Exception(result.message);
        }
        return <String, int>{};
      },
      context: 'getDashboardStats',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get dashboard stats')
    );
  }
  
  Future<OperationResult<List<TeacherProfileModel>>> getPendingTeacherApplications() async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.teachers.getPendingApplications();
        if (result is FirestoreSuccess<List<TeacherProfileModel>>) {
          return result.data;
        } else if (result is FirestoreFailure<List<TeacherProfileModel>>) {
          throw Exception(result.message);
        }
        return <TeacherProfileModel>[];
      },
      context: 'getPendingTeacherApplications',
      loadingManager: _loadingManager,
    ).then((data) => data != null 
        ? SuccessResult(data) 
        : const FailureResult('Failed to get pending applications')
    );
  }
  
  Future<OperationResult<void>> approveTeacher(String teacherId) async {
    return AsyncOperation.execute(
      () async {
        final result = await _firestoreService.teachers.approveTeacher(teacherId);
        if (result is FirestoreSuccess<void>) {
          return;
        } else if (result is FirestoreFailure<void>) {
          throw Exception(result.message);
        }
      },
      context: 'approveTeacher',
      loadingManager: _loadingManager,
    ).then((data) => const SuccessResult(null));
  }
  
  // Stream Methods for Real-time Updates
  Stream<List<StudentModel>> streamStudentsByParent(DocumentReference parentRef) {
    return _firestoreService.students.streamStudentsByParent(parentRef);
  }
  
  Stream<List<LessonModel>> streamLessonsByStudent(DocumentReference studentRef) {
    return _firestoreService.lessons.streamLessonsByStudent(studentRef);
  }
  
  Stream<List<LessonModel>> streamLessonsByTeacher(DocumentReference teacherRef) {
    return _firestoreService.lessons.streamLessonsByTeacher(teacherRef);
  }
  
  Stream<List<PaymentModel>> streamPendingPayments() {
    return _firestoreService.payments.streamPendingPayments();
  }
  
  // Utility Methods
  void clearError() {
    _loadingManager.reset();
  }
  
  // Business Logic Methods
  Future<OperationResult<void>> scheduleLesson({
    required DocumentReference studentRef,
    required DocumentReference teacherRef,
    required DocumentReference locationRef,
    required DateTime scheduledTime,
    required int duration,
    required String language,
    required double price,
    String? parentNote,
  }) async {
    final lesson = LessonModel(
      id: '', // Will be generated by Firestore
      studentRef: studentRef,
      teacherRef: teacherRef,
      locationRef: locationRef,
      scheduledTime: scheduledTime,
      duration: duration,
      language: language,
      status: 'scheduled',
      parentNote: parentNote,
      price: price,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    final lessonResult = await createLesson(lesson);
    if (lessonResult.isSuccess) {
      // Create associated payment
      final payment = PaymentModel(
        id: '', // Will be generated by Firestore
        lessonRef: FirebaseFirestore.instance.collection('lessons').doc(lessonResult.data!),
        amount: price,
        status: 'pending',
        method: 'pix', // Default method
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      return AsyncOperation.execute(
        () async {
          final result = await _firestoreService.payments.create(payment);
          if (result is FirestoreSuccess<DocumentReference>) {
            return;
          } else if (result is FirestoreFailure<DocumentReference>) {
            throw Exception(result.message);
          }
        },
        context: 'scheduleLesson - create payment',
        loadingManager: _loadingManager,
      ).then((data) => const SuccessResult(null));
    } else {
      return FailureResult(lessonResult.errorMessage!);
    }
  }
}

// Singleton instance for global access
final BilinService bilinService = BilinService();