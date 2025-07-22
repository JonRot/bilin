import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bilin/data_schema.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Generic CRUD operations
  Future<DocumentReference> addDocument(String collection, Map<String, dynamic> data) async {
    try {
      return await _firestore.collection(collection).add(data);
    } catch (e) {
      print('Add document error: $e');
      rethrow;
    }
  }

  Future<DocumentSnapshot> getDocument(String collection, String docId) async {
    try {
      return await _firestore.collection(collection).doc(docId).get();
    } catch (e) {
      print('Get document error: $e');
      rethrow;
    }
  }

  Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(docId).update({
        ...data,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Update document error: $e');
      rethrow;
    }
  }

  Future<void> deleteDocument(String collection, String docId) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
    } catch (e) {
      print('Delete document error: $e');
      rethrow;
    }
  }

  // Students
  Future<DocumentReference> createStudent(StudentModel student) async {
    return await addDocument('students', student.toFirestore());
  }

  Future<List<StudentModel>> getStudentsByParent(DocumentReference parentRef) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('students')
          .where('parentRef', isEqualTo: parentRef)
          .get();
      
      return snapshot.docs.map((doc) => StudentModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get students by parent error: $e');
      return [];
    }
  }

  // Teachers
  Future<DocumentReference> createTeacherProfile(TeacherProfileModel teacher) async {
    return await addDocument('teacherProfiles', teacher.toFirestore());
  }

  Future<List<TeacherProfileModel>> getApprovedTeachers({
    String? language,
    DocumentReference? locationRef,
    double? minRate,
    double? maxRate,
  }) async {
    try {
      Query query = _firestore
          .collection('teacherProfiles')
          .where('isApproved', isEqualTo: true);

      if (language != null) {
        query = query.where('languages', arrayContains: language);
      }

      if (locationRef != null) {
        query = query.where('serviceLocationRefs', arrayContains: locationRef);
      }

      if (minRate != null || maxRate != null) {
        if (minRate != null) {
          query = query.where('hourlyRate', isGreaterThanOrEqualTo: minRate);
        }
        if (maxRate != null) {
          query = query.where('hourlyRate', isLessThanOrEqualTo: maxRate);
        }
      }

      query = query.orderBy('rating', descending: true);

      QuerySnapshot snapshot = await query.get();
      return snapshot.docs.map((doc) => TeacherProfileModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get approved teachers error: $e');
      return [];
    }
  }

  Future<TeacherProfileModel?> getTeacherProfile(String teacherId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('teacherProfiles').doc(teacherId).get();
      if (doc.exists) {
        return TeacherProfileModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Get teacher profile error: $e');
      return null;
    }
  }

  Future<TeacherProfileModel?> getTeacherProfileByUserRef(DocumentReference userRef) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('teacherProfiles')
          .where('userRef', isEqualTo: userRef)
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        return TeacherProfileModel.fromFirestore(snapshot.docs.first);
      }
      return null;
    } catch (e) {
      print('Get teacher profile by user ref error: $e');
      return null;
    }
  }

  // Locations
  Future<DocumentReference> createLocation(LocationModel location) async {
    return await addDocument('locations', location.toFirestore());
  }

  Future<List<LocationModel>> getLocationsByUser(DocumentReference userRef) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('locations')
          .where('userRef', isEqualTo: userRef)
          .get();
      
      return snapshot.docs.map((doc) => LocationModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get locations by user error: $e');
      return [];
    }
  }

  // Lessons
  Future<DocumentReference> createLesson(LessonModel lesson) async {
    return await addDocument('lessons', lesson.toFirestore());
  }

  Future<List<LessonModel>> getLessonsByStudent(DocumentReference studentRef) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('lessons')
          .where('studentRef', isEqualTo: studentRef)
          .orderBy('scheduledTime', descending: true)
          .get();
      
      return snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get lessons by student error: $e');
      return [];
    }
  }

  Future<List<LessonModel>> getLessonsByTeacher(DocumentReference teacherRef) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('lessons')
          .where('teacherRef', isEqualTo: teacherRef)
          .orderBy('scheduledTime', descending: true)
          .get();
      
      return snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get lessons by teacher error: $e');
      return [];
    }
  }

  Future<List<LessonModel>> getTodaysLessons() async {
    try {
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      QuerySnapshot snapshot = await _firestore
          .collection('lessons')
          .where('scheduledTime', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('scheduledTime', isLessThanOrEqualTo: Timestamp.fromDate(endOfDay))
          .where('status', isEqualTo: 'scheduled')
          .orderBy('scheduledTime')
          .get();
      
      return snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get today\'s lessons error: $e');
      return [];
    }
  }

  // Payments
  Future<DocumentReference> createPayment(PaymentModel payment) async {
    return await addDocument('payments', payment.toFirestore());
  }

  Future<List<PaymentModel>> getPendingPayments() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('payments')
          .where('status', isEqualTo: 'pending')
          .orderBy('createdAt', descending: true)
          .get();
      
      return snapshot.docs.map((doc) => PaymentModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get pending payments error: $e');
      return [];
    }
  }

  // Progress Reports
  Future<DocumentReference> createProgressReport(ProgressReportModel report) async {
    return await addDocument('progressReports', report.toFirestore());
  }

  Future<List<ProgressReportModel>> getProgressReportsByLesson(DocumentReference lessonRef) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('progressReports')
          .where('lessonRef', isEqualTo: lessonRef)
          .orderBy('createdAt', descending: true)
          .get();
      
      return snapshot.docs.map((doc) => ProgressReportModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get progress reports by lesson error: $e');
      return [];
    }
  }

  // Teacher Availability
  Future<DocumentReference> createTeacherAvailability(TeacherAvailabilityModel availability) async {
    return await addDocument('teacherAvailability', availability.toFirestore());
  }

  Future<TeacherAvailabilityModel?> getTeacherAvailability(DocumentReference teacherRef) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('teacherAvailability')
          .where('teacherRef', isEqualTo: teacherRef)
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        return TeacherAvailabilityModel.fromFirestore(snapshot.docs.first);
      }
      return null;
    } catch (e) {
      print('Get teacher availability error: $e');
      return null;
    }
  }

  // Admin functions
  Future<List<TeacherProfileModel>> getPendingTeacherApplications() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('teacherProfiles')
          .where('isApproved', isEqualTo: false)
          .orderBy('createdAt', descending: true)
          .get();
      
      return snapshot.docs.map((doc) => TeacherProfileModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Get pending teacher applications error: $e');
      return [];
    }
  }

  Future<Map<String, int>> getDashboardStats() async {
    try {
      // Get counts for different collections
      final futures = await Future.wait([
        _firestore.collection('users').where('role', isEqualTo: 'parent').get(),
        _firestore.collection('teacherProfiles').where('isApproved', isEqualTo: true).get(),
        _firestore.collection('lessons').where('status', isEqualTo: 'scheduled').get(),
        _firestore.collection('payments').where('status', isEqualTo: 'pending').get(),
      ]);

      return {
        'parents': futures[0].docs.length,
        'teachers': futures[1].docs.length,
        'upcomingLessons': futures[2].docs.length,
        'pendingPayments': futures[3].docs.length,
      };
    } catch (e) {
      print('Get dashboard stats error: $e');
      return {
        'parents': 0,
        'teachers': 0,
        'upcomingLessons': 0,
        'pendingPayments': 0,
      };
    }
  }

  // Real-time streams
  Stream<List<LessonModel>> getLessonsStream(DocumentReference userRef, String userRole) {
    if (userRole == 'teacher') {
      return _firestore
          .collection('lessons')
          .where('teacherRef', isEqualTo: userRef)
          .orderBy('scheduledTime', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList());
    } else if (userRole == 'parent') {
      // For parents, we need to get lessons for all their students
      // This is simplified - in practice you'd need to get all student refs first
      return _firestore
          .collection('lessons')
          .orderBy('scheduledTime', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => LessonModel.fromFirestore(doc)).toList());
    } else {
      return Stream.value([]);
    }
  }

  Stream<List<PaymentModel>> getPendingPaymentsStream() {
    return _firestore
        .collection('payments')
        .where('status', isEqualTo: 'pending')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PaymentModel.fromFirestore(doc)).toList());
  }
}