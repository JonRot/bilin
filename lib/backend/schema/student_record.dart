import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentRecord extends FirestoreRecord {
  StudentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "studentName" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  bool hasStudentName() => _studentName != null;

  // "studentLastName" field.
  String? _studentLastName;
  String get studentLastName => _studentLastName ?? '';
  bool hasStudentLastName() => _studentLastName != null;

  // "studentDescription" field.
  String? _studentDescription;
  String get studentDescription => _studentDescription ?? '';
  bool hasStudentDescription() => _studentDescription != null;

  // "studentSex" field.
  String? _studentSex;
  String get studentSex => _studentSex ?? '';
  bool hasStudentSex() => _studentSex != null;

  // "studentPhoto" field.
  String? _studentPhoto;
  String get studentPhoto => _studentPhoto ?? '';
  bool hasStudentPhoto() => _studentPhoto != null;

  // "studentBirthday" field.
  DateTime? _studentBirthday;
  DateTime? get studentBirthday => _studentBirthday;
  bool hasStudentBirthday() => _studentBirthday != null;

  // "studentAlergy" field.
  String? _studentAlergy;
  String get studentAlergy => _studentAlergy ?? '';
  bool hasStudentAlergy() => _studentAlergy != null;

  // "studentGoToSchool" field.
  bool? _studentGoToSchool;
  bool get studentGoToSchool => _studentGoToSchool ?? false;
  bool hasStudentGoToSchool() => _studentGoToSchool != null;

  // "studentLanguage" field.
  String? _studentLanguage;
  String get studentLanguage => _studentLanguage ?? '';
  bool hasStudentLanguage() => _studentLanguage != null;

  // "studentTeacherRef" field.
  DocumentReference? _studentTeacherRef;
  DocumentReference? get studentTeacherRef => _studentTeacherRef;
  bool hasStudentTeacherRef() => _studentTeacherRef != null;

  // "studentParentRef" field.
  DocumentReference? _studentParentRef;
  DocumentReference? get studentParentRef => _studentParentRef;
  bool hasStudentParentRef() => _studentParentRef != null;

  // "studentAvailability" field.
  List<AvailabilityStruct>? _studentAvailability;
  List<AvailabilityStruct> get studentAvailability =>
      _studentAvailability ?? const [];
  bool hasStudentAvailability() => _studentAvailability != null;

  // "studentBookingRef" field.
  List<DocumentReference>? _studentBookingRef;
  List<DocumentReference> get studentBookingRef =>
      _studentBookingRef ?? const [];
  bool hasStudentBookingRef() => _studentBookingRef != null;

  void _initializeFields() {
    _studentName = snapshotData['studentName'] as String?;
    _studentLastName = snapshotData['studentLastName'] as String?;
    _studentDescription = snapshotData['studentDescription'] as String?;
    _studentSex = snapshotData['studentSex'] as String?;
    _studentPhoto = snapshotData['studentPhoto'] as String?;
    _studentBirthday = snapshotData['studentBirthday'] as DateTime?;
    _studentAlergy = snapshotData['studentAlergy'] as String?;
    _studentGoToSchool = snapshotData['studentGoToSchool'] as bool?;
    _studentLanguage = snapshotData['studentLanguage'] as String?;
    _studentTeacherRef =
        snapshotData['studentTeacherRef'] as DocumentReference?;
    _studentParentRef = snapshotData['studentParentRef'] as DocumentReference?;
    _studentAvailability = getStructList(
      snapshotData['studentAvailability'],
      AvailabilityStruct.fromMap,
    );
    _studentBookingRef = getDataList(snapshotData['studentBookingRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('student');

  static Stream<StudentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentRecord.fromSnapshot(s));

  static Future<StudentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentRecord.fromSnapshot(s));

  static StudentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentRecordData({
  String? studentName,
  String? studentLastName,
  String? studentDescription,
  String? studentSex,
  String? studentPhoto,
  DateTime? studentBirthday,
  String? studentAlergy,
  bool? studentGoToSchool,
  String? studentLanguage,
  DocumentReference? studentTeacherRef,
  DocumentReference? studentParentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'studentName': studentName,
      'studentLastName': studentLastName,
      'studentDescription': studentDescription,
      'studentSex': studentSex,
      'studentPhoto': studentPhoto,
      'studentBirthday': studentBirthday,
      'studentAlergy': studentAlergy,
      'studentGoToSchool': studentGoToSchool,
      'studentLanguage': studentLanguage,
      'studentTeacherRef': studentTeacherRef,
      'studentParentRef': studentParentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentRecordDocumentEquality implements Equality<StudentRecord> {
  const StudentRecordDocumentEquality();

  @override
  bool equals(StudentRecord? e1, StudentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.studentName == e2?.studentName &&
        e1?.studentLastName == e2?.studentLastName &&
        e1?.studentDescription == e2?.studentDescription &&
        e1?.studentSex == e2?.studentSex &&
        e1?.studentPhoto == e2?.studentPhoto &&
        e1?.studentBirthday == e2?.studentBirthday &&
        e1?.studentAlergy == e2?.studentAlergy &&
        e1?.studentGoToSchool == e2?.studentGoToSchool &&
        e1?.studentLanguage == e2?.studentLanguage &&
        e1?.studentTeacherRef == e2?.studentTeacherRef &&
        e1?.studentParentRef == e2?.studentParentRef &&
        listEquality.equals(e1?.studentAvailability, e2?.studentAvailability) &&
        listEquality.equals(e1?.studentBookingRef, e2?.studentBookingRef);
  }

  @override
  int hash(StudentRecord? e) => const ListEquality().hash([
        e?.studentName,
        e?.studentLastName,
        e?.studentDescription,
        e?.studentSex,
        e?.studentPhoto,
        e?.studentBirthday,
        e?.studentAlergy,
        e?.studentGoToSchool,
        e?.studentLanguage,
        e?.studentTeacherRef,
        e?.studentParentRef,
        e?.studentAvailability,
        e?.studentBookingRef
      ]);

  @override
  bool isValidKey(Object? o) => o is StudentRecord;
}
