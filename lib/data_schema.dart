import 'package:cloud_firestore/cloud_firestore.dart';

// Base model class with common functionality
abstract class FirestoreModel {
  String get id;
  DateTime get createdAt;
  DateTime get updatedAt;
  
  Map<String, dynamic> toFirestore();
  
  // Helper method for safe data extraction
  static T? safeGet<T>(Map<String, dynamic> data, String key, [T? defaultValue]) {
    try {
      return data.containsKey(key) ? data[key] as T : defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }
  
  // Helper method for safe timestamp conversion
  static DateTime? safeTimestamp(dynamic timestamp) {
    try {
      if (timestamp == null) return null;
      if (timestamp is Timestamp) return timestamp.toDate();
      if (timestamp is DateTime) return timestamp;
      return null;
    } catch (e) {
      return null;
    }
  }
  
  // Helper method for safe list conversion
  static List<T> safeList<T>(dynamic list) {
    try {
      if (list == null) return <T>[];
      if (list is List) return List<T>.from(list);
      return <T>[];
    } catch (e) {
      return <T>[];
    }
  }
}

// User data model
class UserModel implements FirestoreModel {
  final String id;
  final String role; // "parent", "teacher", "admin"
  final String email;
  final String phone;
  final String cpf;
  final String name;
  final List<DocumentReference>? studentRefs; // for parents
  final DocumentReference? teacherProfileRef; // for teachers
  final Map<String, dynamic> localizationSettings;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.role,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.name,
    this.studentRefs,
    this.teacherProfileRef,
    required this.localizationSettings,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      role: FirestoreModel.safeGet<String>(data, 'role') ?? '',
      email: FirestoreModel.safeGet<String>(data, 'email') ?? '',
      phone: FirestoreModel.safeGet<String>(data, 'phone') ?? '',
      cpf: FirestoreModel.safeGet<String>(data, 'cpf') ?? '',
      name: FirestoreModel.safeGet<String>(data, 'name') ?? '',
      studentRefs: data['studentRefs'] != null 
          ? List<DocumentReference>.from(data['studentRefs']) 
          : null,
      teacherProfileRef: data['teacherProfileRef'],
      localizationSettings: FirestoreModel.safeGet<Map<String, dynamic>>(data, 'localizationSettings') ?? {},
      createdAt: FirestoreModel.safeTimestamp(data['createdAt']) ?? DateTime.now(),
      updatedAt: FirestoreModel.safeTimestamp(data['updatedAt']) ?? DateTime.now(),
    );
  }
  
  // Create a copy with updated fields
  UserModel copyWith({
    String? role,
    String? email,
    String? phone,
    String? cpf,
    String? name,
    List<DocumentReference>? studentRefs,
    DocumentReference? teacherProfileRef,
    Map<String, dynamic>? localizationSettings,
  }) {
    return UserModel(
      id: id,
      role: role ?? this.role,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      name: name ?? this.name,
      studentRefs: studentRefs ?? this.studentRefs,
      teacherProfileRef: teacherProfileRef ?? this.teacherProfileRef,
      localizationSettings: localizationSettings ?? this.localizationSettings,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'role': role,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'name': name,
      'studentRefs': studentRefs,
      'teacherProfileRef': teacherProfileRef,
      'localizationSettings': localizationSettings,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

// Student data model
class StudentModel {
  final String id;
  final String name;
  final DateTime birthdate;
  final DocumentReference parentRef;
  final List<String> languages;
  final String? specialNeeds;
  final List<DocumentReference> locationRefs;
  final String? profileImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentModel({
    required this.id,
    required this.name,
    required this.birthdate,
    required this.parentRef,
    required this.languages,
    this.specialNeeds,
    required this.locationRefs,
    this.profileImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return StudentModel(
      id: doc.id,
      name: data['name'] ?? '',
      birthdate: (data['birthdate'] as Timestamp).toDate(),
      parentRef: data['parentRef'],
      languages: List<String>.from(data['languages'] ?? []),
      specialNeeds: data['specialNeeds'],
      locationRefs: List<DocumentReference>.from(data['locationRefs'] ?? []),
      profileImageUrl: data['profileImageUrl'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'birthdate': Timestamp.fromDate(birthdate),
      'parentRef': parentRef,
      'languages': languages,
      'specialNeeds': specialNeeds,
      'locationRefs': locationRefs,
      'profileImageUrl': profileImageUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

// Teacher Profile data model
class TeacherProfileModel {
  final String id;
  final DocumentReference userRef;
  final List<String> languages;
  final int experience;
  final double hourlyRate;
  final bool isApproved;
  final double rating;
  final int totalLessons;
  final List<String> certificates;
  final List<DocumentReference> serviceLocationRefs;
  final String bio;
  final String? profileImageUrl;
  final List<String> educationLevel;
  final String? university;
  final DateTime createdAt;
  final DateTime updatedAt;

  TeacherProfileModel({
    required this.id,
    required this.userRef,
    required this.languages,
    required this.experience,
    required this.hourlyRate,
    required this.isApproved,
    required this.rating,
    required this.totalLessons,
    required this.certificates,
    required this.serviceLocationRefs,
    required this.bio,
    this.profileImageUrl,
    required this.educationLevel,
    this.university,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeacherProfileModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TeacherProfileModel(
      id: doc.id,
      userRef: data['userRef'],
      languages: List<String>.from(data['languages'] ?? []),
      experience: data['experience'] ?? 0,
      hourlyRate: (data['hourlyRate'] ?? 0).toDouble(),
      isApproved: data['isApproved'] ?? false,
      rating: (data['rating'] ?? 0).toDouble(),
      totalLessons: data['totalLessons'] ?? 0,
      certificates: List<String>.from(data['certificates'] ?? []),
      serviceLocationRefs: List<DocumentReference>.from(data['serviceLocationRefs'] ?? []),
      bio: data['bio'] ?? '',
      profileImageUrl: data['profileImageUrl'],
      educationLevel: List<String>.from(data['educationLevel'] ?? []),
      university: data['university'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userRef': userRef,
      'languages': languages,
      'experience': experience,
      'hourlyRate': hourlyRate,
      'isApproved': isApproved,
      'rating': rating,
      'totalLessons': totalLessons,
      'certificates': certificates,
      'serviceLocationRefs': serviceLocationRefs,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
      'educationLevel': educationLevel,
      'university': university,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

// Location data model
class LocationModel {
  final String id;
  final String name;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final double latitude;
  final double longitude;
  final DocumentReference userRef;
  final DateTime createdAt;
  final DateTime updatedAt;

  LocationModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
    required this.userRef,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LocationModel(
      id: doc.id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      zipCode: data['zipCode'] ?? '',
      latitude: (data['latitude'] ?? 0).toDouble(),
      longitude: (data['longitude'] ?? 0).toDouble(),
      userRef: data['userRef'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'latitude': latitude,
      'longitude': longitude,
      'userRef': userRef,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

// Lesson data model
class LessonModel {
  final String id;
  final DocumentReference studentRef;
  final DocumentReference teacherRef;
  final DocumentReference locationRef;
  final DateTime scheduledTime;
  final int duration; // in minutes
  final String language;
  final String status; // "scheduled", "completed", "cancelled"
  final String? parentNote;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  LessonModel({
    required this.id,
    required this.studentRef,
    required this.teacherRef,
    required this.locationRef,
    required this.scheduledTime,
    required this.duration,
    required this.language,
    required this.status,
    this.parentNote,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LessonModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LessonModel(
      id: doc.id,
      studentRef: data['studentRef'],
      teacherRef: data['teacherRef'],
      locationRef: data['locationRef'],
      scheduledTime: (data['scheduledTime'] as Timestamp).toDate(),
      duration: data['duration'] ?? 60,
      language: data['language'] ?? '',
      status: data['status'] ?? '',
      parentNote: data['parentNote'],
      price: (data['price'] ?? 0).toDouble(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'studentRef': studentRef,
      'teacherRef': teacherRef,
      'locationRef': locationRef,
      'scheduledTime': Timestamp.fromDate(scheduledTime),
      'duration': duration,
      'language': language,
      'status': status,
      'parentNote': parentNote,
      'price': price,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

// Payment data model
class PaymentModel {
  final String id;
  final DocumentReference lessonRef;
  final double amount;
  final String status; // "pending", "completed"
  final String method; // "pix", "card"
  final DateTime? paidAt;
  final String? transactionId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PaymentModel({
    required this.id,
    required this.lessonRef,
    required this.amount,
    required this.status,
    required this.method,
    this.paidAt,
    this.transactionId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PaymentModel(
      id: doc.id,
      lessonRef: data['lessonRef'],
      amount: (data['amount'] ?? 0).toDouble(),
      status: data['status'] ?? '',
      method: data['method'] ?? '',
      paidAt: data['paidAt'] != null ? (data['paidAt'] as Timestamp).toDate() : null,
      transactionId: data['transactionId'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'lessonRef': lessonRef,
      'amount': amount,
      'status': status,
      'method': method,
      'paidAt': paidAt != null ? Timestamp.fromDate(paidAt!) : null,
      'transactionId': transactionId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

// Progress Report data model
class ProgressReportModel {
  final String id;
  final DocumentReference lessonRef;
  final String attendance;
  final String participation;
  final String comprehension;
  final String speaking;
  final String topicsCovered;
  final String homework;
  final String nextLessonPlan;
  final List<String>? attachments;
  final DateTime createdAt;

  ProgressReportModel({
    required this.id,
    required this.lessonRef,
    required this.attendance,
    required this.participation,
    required this.comprehension,
    required this.speaking,
    required this.topicsCovered,
    required this.homework,
    required this.nextLessonPlan,
    this.attachments,
    required this.createdAt,
  });

  factory ProgressReportModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProgressReportModel(
      id: doc.id,
      lessonRef: data['lessonRef'],
      attendance: data['attendance'] ?? '',
      participation: data['participation'] ?? '',
      comprehension: data['comprehension'] ?? '',
      speaking: data['speaking'] ?? '',
      topicsCovered: data['topicsCovered'] ?? '',
      homework: data['homework'] ?? '',
      nextLessonPlan: data['nextLessonPlan'] ?? '',
      attachments: data['attachments'] != null 
          ? List<String>.from(data['attachments']) 
          : null,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'lessonRef': lessonRef,
      'attendance': attendance,
      'participation': participation,
      'comprehension': comprehension,
      'speaking': speaking,
      'topicsCovered': topicsCovered,
      'homework': homework,
      'nextLessonPlan': nextLessonPlan,
      'attachments': attachments,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}

// Teacher Availability data model
class TeacherAvailabilityModel {
  final String id;
  final DocumentReference teacherRef;
  final List<Map<String, dynamic>> weeklyAvailability;
  final DateTime createdAt;
  final DateTime updatedAt;

  TeacherAvailabilityModel({
    required this.id,
    required this.teacherRef,
    required this.weeklyAvailability,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeacherAvailabilityModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TeacherAvailabilityModel(
      id: doc.id,
      teacherRef: data['teacherRef'],
      weeklyAvailability: List<Map<String, dynamic>>.from(data['weeklyAvailability'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'teacherRef': teacherRef,
      'weeklyAvailability': weeklyAvailability,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}