import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bilin/data_schema.dart';

// Result classes for better error handling
abstract class FirestoreResult<T> {
  const FirestoreResult();
}

class FirestoreSuccess<T> extends FirestoreResult<T> {
  final T data;
  const FirestoreSuccess(this.data);
}

class FirestoreFailure<T> extends FirestoreResult<T> {
  final String message;
  final Exception? exception;
  const FirestoreFailure(this.message, [this.exception]);
}

// Base repository class
abstract class BaseRepository<T> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  String get collectionName;
  T Function(DocumentSnapshot) get fromFirestore;
  
  Future<FirestoreResult<DocumentReference>> create(T model) async {
    try {
      final data = (model as dynamic).toFirestore() as Map<String, dynamic>;
      data['createdAt'] = FieldValue.serverTimestamp();
      data['updatedAt'] = FieldValue.serverTimestamp();
      
      final docRef = await _firestore.collection(collectionName).add(data);
      return FirestoreSuccess(docRef);
    } catch (e) {
      return FirestoreFailure('Failed to create document', e as Exception);
    }
  }
  
  Future<FirestoreResult<T?>> getById(String id) async {
    try {
      final doc = await _firestore.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return FirestoreSuccess(fromFirestore(doc));
      }
      return const FirestoreSuccess(null);
    } catch (e) {
      return FirestoreFailure('Failed to get document by ID', e as Exception);
    }
  }
  
  Future<FirestoreResult<void>> update(String id, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _firestore.collection(collectionName).doc(id).update(data);
      return const FirestoreSuccess(null);
    } catch (e) {
      return FirestoreFailure('Failed to update document', e as Exception);
    }
  }
  
  Future<FirestoreResult<void>> delete(String id) async {
    try {
      await _firestore.collection(collectionName).doc(id).delete();
      return const FirestoreSuccess(null);
    } catch (e) {
      return FirestoreFailure('Failed to delete document', e as Exception);
    }
  }
  
  Stream<List<T>> streamWhere(String field, dynamic value, {String? orderBy, bool descending = false}) {
    Query query = _firestore.collection(collectionName).where(field, isEqualTo: value);
    
    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending);
    }
    
    return query.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => fromFirestore(doc)).toList(),
    );
  }
}

// User Repository
class UserRepository extends BaseRepository<UserModel> {
  @override
  String get collectionName => 'users';
  
  @override
  UserModel Function(DocumentSnapshot) get fromFirestore => UserModel.fromFirestore;
  
  Future<FirestoreResult<UserModel?>> getUserByEmail(String email) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        return FirestoreSuccess(UserModel.fromFirestore(snapshot.docs.first));
      }
      return const FirestoreSuccess(null);
    } catch (e) {
      return FirestoreFailure('Failed to get user by email', e as Exception);
    }
  }
  
  Future<FirestoreResult<List<UserModel>>> getUsersByRole(String role) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('role', isEqualTo: role)
          .get();
      
      final users = snapshot.docs.map((doc) => UserModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(users);
    } catch (e) {
      return FirestoreFailure('Failed to get users by role', e as Exception);
    }
  }
}

// Student Repository
class StudentRepository extends BaseRepository<StudentModel> {
  @override
  String get collectionName => 'students';
  
  @override
  StudentModel Function(DocumentSnapshot) get fromFirestore => StudentModel.fromFirestore;
  
  Future<FirestoreResult<List<StudentModel>>> getStudentsByParent(DocumentReference parentRef) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('parentRef', isEqualTo: parentRef)
          .orderBy('createdAt', descending: true)
          .get();
      
      final students = snapshot.docs.map((doc) => StudentModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(students);
    } catch (e) {
      return FirestoreFailure('Failed to get students by parent', e as Exception);
    }
  }
  
  Stream<List<StudentModel>> streamStudentsByParent(DocumentReference parentRef) {
    return streamWhere('parentRef', parentRef, orderBy: 'createdAt', descending: true);
  }
}

// Teacher Repository
class TeacherRepository extends BaseRepository<TeacherProfileModel> {
  @override
  String get collectionName => 'teachers';
  
  @override
  TeacherProfileModel Function(DocumentSnapshot) get fromFirestore => TeacherProfileModel.fromFirestore;
  
  Future<FirestoreResult<List<TeacherProfileModel>>> getApprovedTeachers({
    String? language,
    DocumentReference? locationRef,
    double? minRate,
    double? maxRate,
    int limit = 20,
  }) async {
    try {
      Query query = _firestore
          .collection(collectionName)
          .where('isApproved', isEqualTo: true);

      if (language != null) {
        query = query.where('languages', arrayContains: language);
      }

      if (locationRef != null) {
        query = query.where('serviceLocationRefs', arrayContains: locationRef);
      }

      if (minRate != null) {
        query = query.where('hourlyRate', isGreaterThanOrEqualTo: minRate);
      }
      
      if (maxRate != null) {
        query = query.where('hourlyRate', isLessThanOrEqualTo: maxRate);
      }

      query = query.orderBy('rating', descending: true).limit(limit);

      final snapshot = await query.get();
      final teachers = snapshot.docs.map((doc) => TeacherProfileModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(teachers);
    } catch (e) {
      return FirestoreFailure('Failed to get approved teachers', e as Exception);
    }
  }
  
  Future<FirestoreResult<TeacherProfileModel?>> getTeacherByUserRef(DocumentReference userRef) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('userRef', isEqualTo: userRef)
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        return FirestoreSuccess(TeacherProfileModel.fromFirestore(snapshot.docs.first));
      }
      return const FirestoreSuccess(null);
    } catch (e) {
      return FirestoreFailure('Failed to get teacher by user ref', e as Exception);
    }
  }
  
  Future<FirestoreResult<List<TeacherProfileModel>>> getPendingApplications() async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('isApproved', isEqualTo: false)
          .orderBy('createdAt', descending: true)
          .get();
      
      final teachers = snapshot.docs.map((doc) => TeacherProfileModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(teachers);
    } catch (e) {
      return FirestoreFailure('Failed to get pending applications', e as Exception);
    }
  }
  
  Future<FirestoreResult<void>> approveTeacher(String teacherId) async {
    return update(teacherId, {'isApproved': true});
  }
  
  Future<FirestoreResult<void>> updateRating(String teacherId, double newRating, int totalLessons) async {
    return update(teacherId, {
      'rating': newRating,
      'totalLessons': totalLessons,
    });
  }
}

// Lesson Repository
class LessonRepository extends BaseRepository<LessonModel> {
  @override
  String get collectionName => 'lessons';
  
  @override
  LessonModel Function(DocumentSnapshot) get fromFirestore => LessonModel.fromFirestore;
  
  Future<FirestoreResult<List<LessonModel>>> getLessonsByStudent(
    DocumentReference studentRef, {
    String? status,
    int limit = 50,
  }) async {
    try {
      Query query = _firestore
          .collection(collectionName)
          .where('studentRef', isEqualTo: studentRef);
      
      if (status != null) {
        query = query.where('status', isEqualTo: status);
      }
      
      query = query.orderBy('scheduledTime', descending: true).limit(limit);
      
      final snapshot = await query.get();
      final lessons = snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(lessons);
    } catch (e) {
      return FirestoreFailure('Failed to get lessons by student', e as Exception);
    }
  }
  
  Future<FirestoreResult<List<LessonModel>>> getLessonsByTeacher(
    DocumentReference teacherRef, {
    String? status,
    int limit = 50,
  }) async {
    try {
      Query query = _firestore
          .collection(collectionName)
          .where('teacherRef', isEqualTo: teacherRef);
      
      if (status != null) {
        query = query.where('status', isEqualTo: status);
      }
      
      query = query.orderBy('scheduledTime', descending: true).limit(limit);
      
      final snapshot = await query.get();
      final lessons = snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(lessons);
    } catch (e) {
      return FirestoreFailure('Failed to get lessons by teacher', e as Exception);
    }
  }
  
  Future<FirestoreResult<List<LessonModel>>> getTodaysLessons({String? status}) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      Query query = _firestore
          .collection(collectionName)
          .where('scheduledTime', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('scheduledTime', isLessThanOrEqualTo: Timestamp.fromDate(endOfDay));
      
      if (status != null) {
        query = query.where('status', isEqualTo: status);
      }
      
      query = query.orderBy('scheduledTime');
      
      final snapshot = await query.get();
      final lessons = snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(lessons);
    } catch (e) {
      return FirestoreFailure('Failed to get today\'s lessons', e as Exception);
    }
  }
  
  Future<FirestoreResult<void>> updateLessonStatus(String lessonId, String status) async {
    return update(lessonId, {'status': status});
  }
  
  Stream<List<LessonModel>> streamLessonsByStudent(DocumentReference studentRef) {
    return streamWhere('studentRef', studentRef, orderBy: 'scheduledTime', descending: true);
  }
  
  Stream<List<LessonModel>> streamLessonsByTeacher(DocumentReference teacherRef) {
    return streamWhere('teacherRef', teacherRef, orderBy: 'scheduledTime', descending: true);
  }
}

// Payment Repository
class PaymentRepository extends BaseRepository<PaymentModel> {
  @override
  String get collectionName => 'payments';
  
  @override
  PaymentModel Function(DocumentSnapshot) get fromFirestore => PaymentModel.fromFirestore;
  
  Future<FirestoreResult<List<PaymentModel>>> getPendingPayments({int limit = 50}) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('status', isEqualTo: 'pending')
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();
      
      final payments = snapshot.docs.map((doc) => PaymentModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(payments);
    } catch (e) {
      return FirestoreFailure('Failed to get pending payments', e as Exception);
    }
  }
  
  Future<FirestoreResult<void>> markPaymentCompleted(String paymentId, String transactionId) async {
    return update(paymentId, {
      'status': 'completed',
      'paidAt': FieldValue.serverTimestamp(),
      'transactionId': transactionId,
    });
  }
  
  Stream<List<PaymentModel>> streamPendingPayments() {
    return streamWhere('status', 'pending', orderBy: 'createdAt', descending: true);
  }
}

// Location Repository
class LocationRepository extends BaseRepository<LocationModel> {
  @override
  String get collectionName => 'locations';
  
  @override
  LocationModel Function(DocumentSnapshot) get fromFirestore => LocationModel.fromFirestore;
  
  Future<FirestoreResult<List<LocationModel>>> getLocationsByUser(DocumentReference userRef) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('userRef', isEqualTo: userRef)
          .orderBy('createdAt', descending: true)
          .get();
      
      final locations = snapshot.docs.map((doc) => LocationModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(locations);
    } catch (e) {
      return FirestoreFailure('Failed to get locations by user', e as Exception);
    }
  }
  
  Future<FirestoreResult<List<LocationModel>>> getLocationsByCity(String city, String state) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('city', isEqualTo: city)
          .where('state', isEqualTo: state)
          .get();
      
      final locations = snapshot.docs.map((doc) => LocationModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(locations);
    } catch (e) {
      return FirestoreFailure('Failed to get locations by city', e as Exception);
    }
  }
}

// Progress Report Repository
class ProgressReportRepository extends BaseRepository<ProgressReportModel> {
  @override
  String get collectionName => 'progressReports';
  
  @override
  ProgressReportModel Function(DocumentSnapshot) get fromFirestore => ProgressReportModel.fromFirestore;
  
  Future<FirestoreResult<List<ProgressReportModel>>> getReportsByLesson(DocumentReference lessonRef) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('lessonRef', isEqualTo: lessonRef)
          .orderBy('createdAt', descending: true)
          .get();
      
      final reports = snapshot.docs.map((doc) => ProgressReportModel.fromFirestore(doc)).toList();
      return FirestoreSuccess(reports);
    } catch (e) {
      return FirestoreFailure('Failed to get reports by lesson', e as Exception);
    }
  }
}

// Teacher Availability Repository
class TeacherAvailabilityRepository extends BaseRepository<TeacherAvailabilityModel> {
  @override
  String get collectionName => 'teacherAvailability';
  
  @override
  TeacherAvailabilityModel Function(DocumentSnapshot) get fromFirestore => TeacherAvailabilityModel.fromFirestore;
  
  Future<FirestoreResult<TeacherAvailabilityModel?>> getAvailabilityByTeacher(DocumentReference teacherRef) async {
    try {
      final snapshot = await _firestore
          .collection(collectionName)
          .where('teacherRef', isEqualTo: teacherRef)
          .orderBy('updatedAt', descending: true)
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        return FirestoreSuccess(TeacherAvailabilityModel.fromFirestore(snapshot.docs.first));
      }
      return const FirestoreSuccess(null);
    } catch (e) {
      return FirestoreFailure('Failed to get availability by teacher', e as Exception);
    }
  }
}

// Main Firestore Service that orchestrates all repositories
class FirestoreService {
  final UserRepository users = UserRepository();
  final StudentRepository students = StudentRepository();
  final TeacherRepository teachers = TeacherRepository();
  final LessonRepository lessons = LessonRepository();
  final PaymentRepository payments = PaymentRepository();
  final LocationRepository locations = LocationRepository();
  final ProgressReportRepository progressReports = ProgressReportRepository();
  final TeacherAvailabilityRepository teacherAvailability = TeacherAvailabilityRepository();
  
  // Dashboard analytics
  Future<FirestoreResult<Map<String, int>>> getDashboardStats() async {
    try {
      final futures = await Future.wait([
        users.getUsersByRole('parent'),
        teachers.getApprovedTeachers(),
        lessons.getTodaysLessons(status: 'scheduled'),
        payments.getPendingPayments(),
      ]);
      
      // Check if any calls failed
      for (final result in futures) {
        if (result is FirestoreFailure) {
          return FirestoreFailure('Failed to get dashboard stats: ${(result as FirestoreFailure).message}');
        }
      }
      
      return FirestoreSuccess({
        'parents': (futures[0] as FirestoreSuccess<List<UserModel>>).data.length,
        'teachers': (futures[1] as FirestoreSuccess<List<TeacherProfileModel>>).data.length,
        'upcomingLessons': (futures[2] as FirestoreSuccess<List<LessonModel>>).data.length,
        'pendingPayments': (futures[3] as FirestoreSuccess<List<PaymentModel>>).data.length,
      });
    } catch (e) {
      return FirestoreFailure('Failed to get dashboard stats', e as Exception);
    }
  }
  
  // Batch operations
  Future<FirestoreResult<void>> batchWrite(List<Map<String, dynamic>> operations) async {
    try {
      final batch = FirebaseFirestore.instance.batch();
      
      for (final operation in operations) {
        final type = operation['type'] as String;
        final collection = operation['collection'] as String;
        final data = operation['data'] as Map<String, dynamic>;
        
        if (type == 'create') {
          final docRef = FirebaseFirestore.instance.collection(collection).doc();
          batch.set(docRef, {
            ...data,
            'createdAt': FieldValue.serverTimestamp(),
            'updatedAt': FieldValue.serverTimestamp(),
          });
        } else if (type == 'update') {
          final docId = operation['docId'] as String;
          final docRef = FirebaseFirestore.instance.collection(collection).doc(docId);
          batch.update(docRef, {
            ...data,
            'updatedAt': FieldValue.serverTimestamp(),
          });
        } else if (type == 'delete') {
          final docId = operation['docId'] as String;
          final docRef = FirebaseFirestore.instance.collection(collection).doc(docId);
          batch.delete(docRef);
        }
      }
      
      await batch.commit();
      return const FirestoreSuccess(null);
    } catch (e) {
      return FirestoreFailure('Failed to perform batch operation', e as Exception);
    }
  }
}