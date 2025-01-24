import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesRequesterRecord extends FirestoreRecord {
  ClassesRequesterRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isArchived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  // "requesterTeacher" field.
  DocumentReference? _requesterTeacher;
  DocumentReference? get requesterTeacher => _requesterTeacher;
  bool hasRequesterTeacher() => _requesterTeacher != null;

  // "requesterStudent" field.
  DocumentReference? _requesterStudent;
  DocumentReference? get requesterStudent => _requesterStudent;
  bool hasRequesterStudent() => _requesterStudent != null;

  // "requesterLocation" field.
  DocumentReference? _requesterLocation;
  DocumentReference? get requesterLocation => _requesterLocation;
  bool hasRequesterLocation() => _requesterLocation != null;

  // "requesterLanguage" field.
  List<String>? _requesterLanguage;
  List<String> get requesterLanguage => _requesterLanguage ?? const [];
  bool hasRequesterLanguage() => _requesterLanguage != null;

  // "requesterDescription" field.
  String? _requesterDescription;
  String get requesterDescription => _requesterDescription ?? '';
  bool hasRequesterDescription() => _requesterDescription != null;

  // "requesterParent" field.
  DocumentReference? _requesterParent;
  DocumentReference? get requesterParent => _requesterParent;
  bool hasRequesterParent() => _requesterParent != null;

  // "requesterClass" field.
  DocumentReference? _requesterClass;
  DocumentReference? get requesterClass => _requesterClass;
  bool hasRequesterClass() => _requesterClass != null;

  // "requesterAvailability" field.
  List<AvailabilityStruct>? _requesterAvailability;
  List<AvailabilityStruct> get requesterAvailability =>
      _requesterAvailability ?? const [];
  bool hasRequesterAvailability() => _requesterAvailability != null;

  void _initializeFields() {
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isArchived = snapshotData['isArchived'] as bool?;
    _requesterTeacher = snapshotData['requesterTeacher'] as DocumentReference?;
    _requesterStudent = snapshotData['requesterStudent'] as DocumentReference?;
    _requesterLocation =
        snapshotData['requesterLocation'] as DocumentReference?;
    _requesterLanguage = getDataList(snapshotData['requesterLanguage']);
    _requesterDescription = snapshotData['requesterDescription'] as String?;
    _requesterParent = snapshotData['requesterParent'] as DocumentReference?;
    _requesterClass = snapshotData['requesterClass'] as DocumentReference?;
    _requesterAvailability = getStructList(
      snapshotData['requesterAvailability'],
      AvailabilityStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classesRequester');

  static Stream<ClassesRequesterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesRequesterRecord.fromSnapshot(s));

  static Future<ClassesRequesterRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClassesRequesterRecord.fromSnapshot(s));

  static ClassesRequesterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesRequesterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesRequesterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesRequesterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesRequesterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassesRequesterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassesRequesterRecordData({
  DateTime? createdTime,
  bool? isArchived,
  DocumentReference? requesterTeacher,
  DocumentReference? requesterStudent,
  DocumentReference? requesterLocation,
  String? requesterDescription,
  DocumentReference? requesterParent,
  DocumentReference? requesterClass,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdTime': createdTime,
      'isArchived': isArchived,
      'requesterTeacher': requesterTeacher,
      'requesterStudent': requesterStudent,
      'requesterLocation': requesterLocation,
      'requesterDescription': requesterDescription,
      'requesterParent': requesterParent,
      'requesterClass': requesterClass,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClassesRequesterRecordDocumentEquality
    implements Equality<ClassesRequesterRecord> {
  const ClassesRequesterRecordDocumentEquality();

  @override
  bool equals(ClassesRequesterRecord? e1, ClassesRequesterRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.isArchived == e2?.isArchived &&
        e1?.requesterTeacher == e2?.requesterTeacher &&
        e1?.requesterStudent == e2?.requesterStudent &&
        e1?.requesterLocation == e2?.requesterLocation &&
        listEquality.equals(e1?.requesterLanguage, e2?.requesterLanguage) &&
        e1?.requesterDescription == e2?.requesterDescription &&
        e1?.requesterParent == e2?.requesterParent &&
        e1?.requesterClass == e2?.requesterClass &&
        listEquality.equals(
            e1?.requesterAvailability, e2?.requesterAvailability);
  }

  @override
  int hash(ClassesRequesterRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.isArchived,
        e?.requesterTeacher,
        e?.requesterStudent,
        e?.requesterLocation,
        e?.requesterLanguage,
        e?.requesterDescription,
        e?.requesterParent,
        e?.requesterClass,
        e?.requesterAvailability
      ]);

  @override
  bool isValidKey(Object? o) => o is ClassesRequesterRecord;
}
