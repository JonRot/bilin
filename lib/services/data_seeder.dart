import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bilin/sample_data.dart';

class DataSeeder {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Seeds the Firestore database with sample data
  /// This should only be called once or in development environments
  static Future<void> seedDatabase() async {
    try {
      print('Starting database seeding...');
      
      // Clear existing data (optional - comment out in production)
      // await _clearCollections();
      
      // Seed collections in order due to dependencies
      Map<String, List<DocumentReference>> documentRefs = {};
      
      // 1. Seed Users first
      documentRefs['users'] = await _seedCollection('users');
      
      // 2. Seed Locations
      documentRefs['locations'] = await _seedCollection('locations');
      
      // 3. Seed Students (need parent references)
      documentRefs['students'] = await _seedStudents(documentRefs['users']!);
      
      // 4. Seed Teacher Profiles (need teacher user references)
      documentRefs['teacherProfiles'] = await _seedTeacherProfiles(documentRefs['users']!);
      
      // 5. Seed Teacher Availability (need teacher profile references)
      documentRefs['teacherAvailability'] = await _seedTeacherAvailability(documentRefs['teacherProfiles']!);
      
      // 6. Seed Lessons (need student, teacher, location references)
      documentRefs['lessons'] = await _seedLessons(
        documentRefs['students']!,
        documentRefs['teacherProfiles']!,
        documentRefs['locations']!,
      );
      
      // 7. Seed Payments (need lesson references)
      documentRefs['payments'] = await _seedPayments(documentRefs['lessons']!);
      
      // 8. Seed Progress Reports (need lesson references)
      documentRefs['progressReports'] = await _seedProgressReports(documentRefs['lessons']!);
      
      // 9. Update user documents with their related references
      await _updateUserReferences(documentRefs);
      
      print('Database seeding completed successfully!');
      
    } catch (e) {
      print('Error seeding database: $e');
      rethrow;
    }
  }

  /// Seeds a simple collection without complex references
  static Future<List<DocumentReference>> _seedCollection(String collectionName) async {
    print('Seeding $collectionName...');
    
    final data = sampleData[collectionName]!;
    List<DocumentReference> refs = [];
    
    for (int i = 0; i < data.length; i++) {
      final docData = Map<String, dynamic>.from(data[i]);
      
      // Replace TIMESTAMP placeholders with actual timestamps
      _replacePlaceholderTimestamps(docData);
      
      final docRef = await _firestore.collection(collectionName).add(docData);
      refs.add(docRef);
      print('Created $collectionName document: ${docRef.id}');
    }
    
    return refs;
  }

  /// Seeds students with parent references
  static Future<List<DocumentReference>> _seedStudents(List<DocumentReference> userRefs) async {
    print('Seeding students...');
    
    final studentsData = sampleData['students']!;
    List<DocumentReference> refs = [];
    
    // Get parent user references (first 3 users are parents)
    final parentRefs = userRefs.take(3).toList();
    
    for (int i = 0; i < studentsData.length; i++) {
      final docData = Map<String, dynamic>.from(studentsData[i]);
      
      // Assign parent reference
      final parentIndex = i < 2 ? 0 : (i < 3 ? 1 : 2); // Maria has 2 kids, others have 1 each
      docData['parentRef'] = parentRefs[parentIndex];
      
      // Set birthdate based on age mentioned in comments
      final ages = [8, 12, 10, 9, 7];
      final birthYear = DateTime.now().year - ages[i];
      docData['birthdate'] = Timestamp.fromDate(DateTime(birthYear, 6, 15));
      
      _replacePlaceholderTimestamps(docData);
      
      final docRef = await _firestore.collection('students').add(docData);
      refs.add(docRef);
      print('Created student document: ${docRef.id}');
    }
    
    return refs;
  }

  /// Seeds teacher profiles with teacher user references
  static Future<List<DocumentReference>> _seedTeacherProfiles(List<DocumentReference> userRefs) async {
    print('Seeding teacher profiles...');
    
    final profilesData = sampleData['teacherProfiles']!;
    List<DocumentReference> refs = [];
    
    // Get teacher user references (users 3, 4, 5 are teachers)
    final teacherRefs = userRefs.skip(3).take(3).toList();
    
    for (int i = 0; i < profilesData.length; i++) {
      final docData = Map<String, dynamic>.from(profilesData[i]);
      docData['userRef'] = teacherRefs[i];
      
      _replacePlaceholderTimestamps(docData);
      
      final docRef = await _firestore.collection('teacherProfiles').add(docData);
      refs.add(docRef);
      print('Created teacher profile document: ${docRef.id}');
    }
    
    return refs;
  }

  /// Seeds teacher availability with teacher profile references
  static Future<List<DocumentReference>> _seedTeacherAvailability(List<DocumentReference> teacherProfileRefs) async {
    print('Seeding teacher availability...');
    
    final availabilityData = sampleData['teacherAvailability']!;
    List<DocumentReference> refs = [];
    
    for (int i = 0; i < availabilityData.length && i < teacherProfileRefs.length; i++) {
      final docData = Map<String, dynamic>.from(availabilityData[i]);
      docData['teacherRef'] = teacherProfileRefs[i];
      
      _replacePlaceholderTimestamps(docData);
      
      final docRef = await _firestore.collection('teacherAvailability').add(docData);
      refs.add(docRef);
      print('Created teacher availability document: ${docRef.id}');
    }
    
    return refs;
  }

  /// Seeds lessons with student, teacher, and location references
  static Future<List<DocumentReference>> _seedLessons(
    List<DocumentReference> studentRefs,
    List<DocumentReference> teacherRefs,
    List<DocumentReference> locationRefs,
  ) async {
    print('Seeding lessons...');
    
    final lessonsData = sampleData['lessons']!;
    List<DocumentReference> refs = [];
    
    final now = DateTime.now();
    final scheduledTimes = [
      now.add(const Duration(days: 7)), // Next Monday
      now.subtract(const Duration(days: 7)), // Last week
      now.add(const Duration(days: 1)), // Tomorrow
      now.subtract(const Duration(days: 1)), // Yesterday
    ];
    
    for (int i = 0; i < lessonsData.length; i++) {
      final docData = Map<String, dynamic>.from(lessonsData[i]);
      
      // Assign references
      docData['studentRef'] = studentRefs[i % studentRefs.length];
      docData['teacherRef'] = teacherRefs[i % teacherRefs.length];
      docData['locationRef'] = locationRefs[i % locationRefs.length];
      
      // Set scheduled time
      docData['scheduledTime'] = Timestamp.fromDate(scheduledTimes[i]);
      
      _replacePlaceholderTimestamps(docData);
      
      final docRef = await _firestore.collection('lessons').add(docData);
      refs.add(docRef);
      print('Created lesson document: ${docRef.id}');
    }
    
    return refs;
  }

  /// Seeds payments with lesson references
  static Future<List<DocumentReference>> _seedPayments(List<DocumentReference> lessonRefs) async {
    print('Seeding payments...');
    
    final paymentsData = sampleData['payments']!;
    List<DocumentReference> refs = [];
    
    for (int i = 0; i < paymentsData.length && i < lessonRefs.length; i++) {
      final docData = Map<String, dynamic>.from(paymentsData[i]);
      docData['lessonRef'] = lessonRefs[i];
      
      // Set paidAt timestamp for completed payments
      if (docData['status'] == 'completed') {
        docData['paidAt'] = Timestamp.fromDate(DateTime.now().subtract(Duration(days: i + 1)));
      }
      
      _replacePlaceholderTimestamps(docData);
      
      final docRef = await _firestore.collection('payments').add(docData);
      refs.add(docRef);
      print('Created payment document: ${docRef.id}');
    }
    
    return refs;
  }

  /// Seeds progress reports with lesson references
  static Future<List<DocumentReference>> _seedProgressReports(List<DocumentReference> lessonRefs) async {
    print('Seeding progress reports...');
    
    final reportsData = sampleData['progressReports']!;
    List<DocumentReference> refs = [];
    
    // Only create reports for completed lessons (first 2 lessons in our sample are completed)
    for (int i = 0; i < reportsData.length && i < 2; i++) {
      final docData = Map<String, dynamic>.from(reportsData[i]);
      docData['lessonRef'] = lessonRefs[i + 1]; // Skip first lesson (it's scheduled)
      
      _replacePlaceholderTimestamps(docData);
      
      final docRef = await _firestore.collection('progressReports').add(docData);
      refs.add(docRef);
      print('Created progress report document: ${docRef.id}');
    }
    
    return refs;
  }

  /// Updates user documents with references to their related data
  static Future<void> _updateUserReferences(Map<String, List<DocumentReference>> documentRefs) async {
    print('Updating user references...');
    
    final userRefs = documentRefs['users']!;
    final studentRefs = documentRefs['students']!;
    final locationRefs = documentRefs['locations']!;
    final teacherProfileRefs = documentRefs['teacherProfiles']!;
    
    // Update parent users with student and location references
    for (int i = 0; i < 3; i++) { // First 3 users are parents
      final List<DocumentReference> userStudents = [];
      final List<DocumentReference> userLocations = [];
      
      // Assign students to parents
      if (i == 0) { // Maria has 2 children
        userStudents.addAll([studentRefs[0], studentRefs[1]]);
        userLocations.add(locationRefs[0]);
      } else if (i == 1) { // Carlos has 1 child
        userStudents.add(studentRefs[2]);
        userLocations.add(locationRefs[1]);
      } else { // Ana has 2 children
        userStudents.addAll([studentRefs[3], studentRefs[4]]);
        userLocations.add(locationRefs[2]);
      }
      
      await userRefs[i].update({
        'studentRefs': userStudents,
        'locationRefs': userLocations,
      });
    }
    
    // Update teacher users with teacher profile references
    for (int i = 0; i < teacherProfileRefs.length; i++) {
      final teacherUserIndex = i + 3; // Teachers start at index 3
      await userRefs[teacherUserIndex].update({
        'teacherProfileRef': teacherProfileRefs[i],
      });
    }
    
    print('User references updated successfully!');
  }

  /// Replaces 'TIMESTAMP' placeholders with actual Timestamp objects
  static void _replacePlaceholderTimestamps(Map<String, dynamic> data) {
    final now = Timestamp.now();
    
    data.forEach((key, value) {
      if (value == 'TIMESTAMP') {
        data[key] = now;
      } else if (value is Map<String, dynamic>) {
        _replacePlaceholderTimestamps(value);
      } else if (value is List) {
        for (int i = 0; i < value.length; i++) {
          if (value[i] == 'TIMESTAMP') {
            value[i] = now;
          } else if (value[i] is Map<String, dynamic>) {
            _replacePlaceholderTimestamps(value[i]);
          }
        }
      }
    });
  }

  /// Clears all collections (use with caution!)
  static Future<void> _clearCollections() async {
    print('Clearing existing collections...');
    
    final collections = [
      'users', 'students', 'teacherProfiles', 'lessons', 
      'payments', 'progressReports', 'teacherAvailability', 'locations'
    ];
    
    for (final collection in collections) {
      final snapshot = await _firestore.collection(collection).get();
      for (final doc in snapshot.docs) {
        await doc.reference.delete();
      }
    }
    
    print('Collections cleared!');
  }
}