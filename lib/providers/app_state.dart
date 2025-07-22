import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bilin/data_schema.dart';
import 'package:bilin/services/auth_service.dart';
import 'package:bilin/services/firestore_service.dart';

class AppState extends ChangeNotifier {
  // Services
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  // Global State Variables as specified in requirements
  DocumentReference? _currentUser;
  String? _userRole; // "parent", "teacher", "admin"
  DocumentReference? _selectedStudent;
  DocumentReference? _selectedLocation;
  DocumentReference? _currentLesson;
  List<DocumentReference> _pendingPayments = [];

  // Additional state for UI management
  UserModel? _currentUserData;
  List<StudentModel> _userStudents = [];
  List<LocationModel> _userLocations = [];
  TeacherProfileModel? _teacherProfile;
  bool _isLoading = false;
  String? _errorMessage;

  // Booking flow state
  Map<String, dynamic>? _pendingBooking;

  // Getters
  DocumentReference? get currentUser => _currentUser;
  String? get userRole => _userRole;
  DocumentReference? get selectedStudent => _selectedStudent;
  DocumentReference? get selectedLocation => _selectedLocation;
  DocumentReference? get currentLesson => _currentLesson;
  List<DocumentReference> get pendingPayments => _pendingPayments;
  
  UserModel? get currentUserData => _currentUserData;
  List<StudentModel> get userStudents => _userStudents;
  List<LocationModel> get userLocations => _userLocations;
  TeacherProfileModel? get teacherProfile => _teacherProfile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Map<String, dynamic>? get pendingBooking => _pendingBooking;

  // Derived getters for convenience
  bool get isAuthenticated => _currentUser != null;
  bool get isParent => _userRole == 'parent';
  bool get isTeacher => _userRole == 'teacher';
  bool get isAdmin => _userRole == 'admin';

  // Initialize app state
  Future<void> initializeAppState() async {
    setLoading(true);
    
    try {
      User? firebaseUser = _authService.currentUser;
      if (firebaseUser != null) {
        await _loadUserData(firebaseUser.uid);
      }
    } catch (e) {
      setError('Failed to initialize app: $e');
    } finally {
      setLoading(false);
    }
  }

  // Authentication methods
  Future<bool> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String role,
    required String name,
    required String phone,
    required String cpf,
  }) async {
    setLoading(true);
    clearError();

    try {
      UserCredential? result = await _authService.signUpWithEmailAndPassword(
        email, password, role, name, phone, cpf,
      );

      if (result != null && result.user != null) {
        await _loadUserData(result.user!.uid);
        return true;
      }
      return false;
    } catch (e) {
      setError('Sign up failed: $e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setLoading(true);
    clearError();

    try {
      UserCredential? result = await _authService.signInWithEmailAndPassword(email, password);
      
      if (result != null && result.user != null) {
        await _loadUserData(result.user!.uid);
        return true;
      }
      return false;
    } catch (e) {
      setError('Sign in failed: $e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {
    setLoading(true);
    
    try {
      await _authService.signOut();
      _clearAllState();
    } catch (e) {
      setError('Sign out failed: $e');
    } finally {
      setLoading(false);
    }
  }

  // Load user data and related information
  Future<void> _loadUserData(String uid) async {
    try {
      // Create user reference
      _currentUser = FirebaseFirestore.instance.collection('users').doc(uid);
      
      // Load user data
      _currentUserData = await _authService.getUserData(uid);
      _userRole = _currentUserData?.role;

      // Load role-specific data
      if (_userRole == 'parent') {
        await _loadParentData();
      } else if (_userRole == 'teacher') {
        await _loadTeacherData();
      }

      notifyListeners();
    } catch (e) {
      setError('Failed to load user data: $e');
    }
  }

  Future<void> _loadParentData() async {
    if (_currentUser != null) {
      // Load students
      _userStudents = await _firestoreService.getStudentsByParent(_currentUser!);
      
      // Load locations
      _userLocations = await _firestoreService.getLocationsByUser(_currentUser!);
      
      // Set default selected student if available
      if (_userStudents.isNotEmpty && _selectedStudent == null) {
        _selectedStudent = FirebaseFirestore.instance
            .collection('students')
            .doc(_userStudents.first.id);
      }
    }
  }

  Future<void> _loadTeacherData() async {
    if (_currentUser != null) {
      // Load teacher profile
      _teacherProfile = await _firestoreService.getTeacherProfileByUserRef(_currentUser!);
      
      // Load service locations
      _userLocations = await _firestoreService.getLocationsByUser(_currentUser!);
    }
  }

  // State management methods
  void setSelectedStudent(DocumentReference? studentRef) {
    _selectedStudent = studentRef;
    notifyListeners();
  }

  void setSelectedLocation(DocumentReference? locationRef) {
    _selectedLocation = locationRef;
    notifyListeners();
  }

  void setCurrentLesson(DocumentReference? lessonRef) {
    _currentLesson = lessonRef;
    notifyListeners();
  }

  void setPendingPayments(List<DocumentReference> payments) {
    _pendingPayments = payments;
    notifyListeners();
  }

  void addPendingPayment(DocumentReference paymentRef) {
    if (!_pendingPayments.contains(paymentRef)) {
      _pendingPayments.add(paymentRef);
      notifyListeners();
    }
  }

  void removePendingPayment(DocumentReference paymentRef) {
    _pendingPayments.remove(paymentRef);
    notifyListeners();
  }

  // Booking flow methods
  void setPendingBooking(Map<String, dynamic> booking) {
    _pendingBooking = booking;
    notifyListeners();
  }

  void clearPendingBooking() {
    _pendingBooking = null;
    notifyListeners();
  }

  // Student management methods
  Future<void> addStudent(StudentModel student) async {
    setLoading(true);
    
    try {
      DocumentReference studentRef = await _firestoreService.createStudent(student);
      
      // Update local state
      _userStudents.add(student.copyWith(id: studentRef.id));
      
      // Update user's student references
      if (_currentUser != null) {
        List<DocumentReference> studentRefs = _userStudents
            .map((s) => FirebaseFirestore.instance.collection('students').doc(s.id))
            .toList();
        
        await _firestoreService.updateDocument('users', _currentUser!.id, {
          'studentRefs': studentRefs,
        });
      }
      
      // Set as selected if it's the first student
      if (_userStudents.length == 1) {
        setSelectedStudent(studentRef);
      }
      
      notifyListeners();
    } catch (e) {
      setError('Failed to add student: $e');
    } finally {
      setLoading(false);
    }
  }

  // Location management methods
  Future<void> addLocation(LocationModel location) async {
    setLoading(true);
    
    try {
      DocumentReference locationRef = await _firestoreService.createLocation(location);
      
      // Update local state
      _userLocations.add(location.copyWith(id: locationRef.id));
      
      // Set as selected if it's the first location
      if (_userLocations.length == 1) {
        setSelectedLocation(locationRef);
      }
      
      notifyListeners();
    } catch (e) {
      setError('Failed to add location: $e');
    } finally {
      setLoading(false);
    }
  }

  // Teacher profile methods
  Future<void> createTeacherProfile(TeacherProfileModel profile) async {
    setLoading(true);
    
    try {
      DocumentReference profileRef = await _firestoreService.createTeacherProfile(profile);
      
      // Update user document with teacher profile reference
      if (_currentUser != null) {
        await _firestoreService.updateDocument('users', _currentUser!.id, {
          'teacherProfileRef': profileRef,
        });
      }
      
      // Update local state
      _teacherProfile = profile.copyWith(id: profileRef.id);
      notifyListeners();
    } catch (e) {
      setError('Failed to create teacher profile: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> updateTeacherProfile(Map<String, dynamic> updates) async {
    setLoading(true);
    
    try {
      if (_teacherProfile != null) {
        await _firestoreService.updateDocument('teacherProfiles', _teacherProfile!.id, updates);
        
        // Reload teacher profile
        if (_currentUser != null) {
          _teacherProfile = await _firestoreService.getTeacherProfileByUserRef(_currentUser!);
          notifyListeners();
        }
      }
    } catch (e) {
      setError('Failed to update teacher profile: $e');
    } finally {
      setLoading(false);
    }
  }

  // Refresh data
  Future<void> refreshUserData() async {
    if (_currentUser != null) {
      await _loadUserData(_currentUser!.id);
    }
  }

  // Utility methods
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _clearAllState() {
    _currentUser = null;
    _userRole = null;
    _selectedStudent = null;
    _selectedLocation = null;
    _currentLesson = null;
    _pendingPayments.clear();
    _currentUserData = null;
    _userStudents.clear();
    _userLocations.clear();
    _teacherProfile = null;
    _pendingBooking = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// Extension for copying models with updated id
extension StudentModelExtension on StudentModel {
  StudentModel copyWith({
    String? id,
    String? name,
    DateTime? birthdate,
    DocumentReference? parentRef,
    List<String>? languages,
    String? specialNeeds,
    List<DocumentReference>? locationRefs,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      birthdate: birthdate ?? this.birthdate,
      parentRef: parentRef ?? this.parentRef,
      languages: languages ?? this.languages,
      specialNeeds: specialNeeds ?? this.specialNeeds,
      locationRefs: locationRefs ?? this.locationRefs,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

extension LocationModelExtension on LocationModel {
  LocationModel copyWith({
    String? id,
    String? name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    double? latitude,
    double? longitude,
    DocumentReference? userRef,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LocationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      userRef: userRef ?? this.userRef,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

extension TeacherProfileModelExtension on TeacherProfileModel {
  TeacherProfileModel copyWith({
    String? id,
    DocumentReference? userRef,
    List<String>? languages,
    int? experience,
    double? hourlyRate,
    bool? isApproved,
    double? rating,
    int? totalLessons,
    List<String>? certificates,
    List<DocumentReference>? serviceLocationRefs,
    String? bio,
    String? profileImageUrl,
    List<String>? educationLevel,
    String? university,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TeacherProfileModel(
      id: id ?? this.id,
      userRef: userRef ?? this.userRef,
      languages: languages ?? this.languages,
      experience: experience ?? this.experience,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      isApproved: isApproved ?? this.isApproved,
      rating: rating ?? this.rating,
      totalLessons: totalLessons ?? this.totalLessons,
      certificates: certificates ?? this.certificates,
      serviceLocationRefs: serviceLocationRefs ?? this.serviceLocationRefs,
      bio: bio ?? this.bio,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      educationLevel: educationLevel ?? this.educationLevel,
      university: university ?? this.university,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}