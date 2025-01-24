import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  Role? _role;
  Role? get role => _role;
  bool hasRole() => _role != null;

  // "activeNav" field.
  bool? _activeNav;
  bool get activeNav => _activeNav ?? false;
  bool hasActiveNav() => _activeNav != null;

  // "display_last_name" field.
  String? _displayLastName;
  String get displayLastName => _displayLastName ?? '';
  bool hasDisplayLastName() => _displayLastName != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "UserCompleted" field.
  bool? _userCompleted;
  bool get userCompleted => _userCompleted ?? false;
  bool hasUserCompleted() => _userCompleted != null;

  // "userRefClasses" field.
  DocumentReference? _userRefClasses;
  DocumentReference? get userRefClasses => _userRefClasses;
  bool hasUserRefClasses() => _userRefClasses != null;

  // "userRefLocation" field.
  List<DocumentReference>? _userRefLocation;
  List<DocumentReference> get userRefLocation => _userRefLocation ?? const [];
  bool hasUserRefLocation() => _userRefLocation != null;

  // "userRefStudent" field.
  List<DocumentReference>? _userRefStudent;
  List<DocumentReference> get userRefStudent => _userRefStudent ?? const [];
  bool hasUserRefStudent() => _userRefStudent != null;

  // "userRefRequestAvailability" field.
  DocumentReference? _userRefRequestAvailability;
  DocumentReference? get userRefRequestAvailability =>
      _userRefRequestAvailability;
  bool hasUserRefRequestAvailability() => _userRefRequestAvailability != null;

  // "userRefClassRequester" field.
  DocumentReference? _userRefClassRequester;
  DocumentReference? get userRefClassRequester => _userRefClassRequester;
  bool hasUserRefClassRequester() => _userRefClassRequester != null;

  // "userDefaultLocation" field.
  String? _userDefaultLocation;
  String get userDefaultLocation => _userDefaultLocation ?? '';
  bool hasUserDefaultLocation() => _userDefaultLocation != null;

  // "userRefBookings" field.
  List<DocumentReference>? _userRefBookings;
  List<DocumentReference> get userRefBookings => _userRefBookings ?? const [];
  bool hasUserRefBookings() => _userRefBookings != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] is Role
        ? snapshotData['role']
        : deserializeEnum<Role>(snapshotData['role']);
    _activeNav = snapshotData['activeNav'] as bool?;
    _displayLastName = snapshotData['display_last_name'] as String?;
    _cpf = snapshotData['cpf'] as String?;
    _userCompleted = snapshotData['UserCompleted'] as bool?;
    _userRefClasses = snapshotData['userRefClasses'] as DocumentReference?;
    _userRefLocation = getDataList(snapshotData['userRefLocation']);
    _userRefStudent = getDataList(snapshotData['userRefStudent']);
    _userRefRequestAvailability =
        snapshotData['userRefRequestAvailability'] as DocumentReference?;
    _userRefClassRequester =
        snapshotData['userRefClassRequester'] as DocumentReference?;
    _userDefaultLocation = snapshotData['userDefaultLocation'] as String?;
    _userRefBookings = getDataList(snapshotData['userRefBookings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  Role? role,
  bool? activeNav,
  String? displayLastName,
  String? cpf,
  bool? userCompleted,
  DocumentReference? userRefClasses,
  DocumentReference? userRefRequestAvailability,
  DocumentReference? userRefClassRequester,
  String? userDefaultLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'activeNav': activeNav,
      'display_last_name': displayLastName,
      'cpf': cpf,
      'UserCompleted': userCompleted,
      'userRefClasses': userRefClasses,
      'userRefRequestAvailability': userRefRequestAvailability,
      'userRefClassRequester': userRefClassRequester,
      'userDefaultLocation': userDefaultLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.activeNav == e2?.activeNav &&
        e1?.displayLastName == e2?.displayLastName &&
        e1?.cpf == e2?.cpf &&
        e1?.userCompleted == e2?.userCompleted &&
        e1?.userRefClasses == e2?.userRefClasses &&
        listEquality.equals(e1?.userRefLocation, e2?.userRefLocation) &&
        listEquality.equals(e1?.userRefStudent, e2?.userRefStudent) &&
        e1?.userRefRequestAvailability == e2?.userRefRequestAvailability &&
        e1?.userRefClassRequester == e2?.userRefClassRequester &&
        e1?.userDefaultLocation == e2?.userDefaultLocation &&
        listEquality.equals(e1?.userRefBookings, e2?.userRefBookings);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.activeNav,
        e?.displayLastName,
        e?.cpf,
        e?.userCompleted,
        e?.userRefClasses,
        e?.userRefLocation,
        e?.userRefStudent,
        e?.userRefRequestAvailability,
        e?.userRefClassRequester,
        e?.userDefaultLocation,
        e?.userRefBookings
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
