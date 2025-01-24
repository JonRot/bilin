import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestAvailabilityRecord extends FirestoreRecord {
  RequestAvailabilityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "requestAvailability" field.
  List<AvailabilityStruct>? _requestAvailability;
  List<AvailabilityStruct> get requestAvailability =>
      _requestAvailability ?? const [];
  bool hasRequestAvailability() => _requestAvailability != null;

  // "requestLocationDecRef" field.
  DocumentReference? _requestLocationDecRef;
  DocumentReference? get requestLocationDecRef => _requestLocationDecRef;
  bool hasRequestLocationDecRef() => _requestLocationDecRef != null;

  // "requestComment" field.
  String? _requestComment;
  String get requestComment => _requestComment ?? '';
  bool hasRequestComment() => _requestComment != null;

  // "requestMinAge" field.
  int? _requestMinAge;
  int get requestMinAge => _requestMinAge ?? 0;
  bool hasRequestMinAge() => _requestMinAge != null;

  // "requestMaxAge" field.
  int? _requestMaxAge;
  int get requestMaxAge => _requestMaxAge ?? 0;
  bool hasRequestMaxAge() => _requestMaxAge != null;

  // "requestStatus" field.
  Status? _requestStatus;
  Status? get requestStatus => _requestStatus;
  bool hasRequestStatus() => _requestStatus != null;

  // "requestTeacherDocRef" field.
  DocumentReference? _requestTeacherDocRef;
  DocumentReference? get requestTeacherDocRef => _requestTeacherDocRef;
  bool hasRequestTeacherDocRef() => _requestTeacherDocRef != null;

  // "requestClassDayStart" field.
  DateTime? _requestClassDayStart;
  DateTime? get requestClassDayStart => _requestClassDayStart;
  bool hasRequestClassDayStart() => _requestClassDayStart != null;

  // "requestLanguage" field.
  List<String>? _requestLanguage;
  List<String> get requestLanguage => _requestLanguage ?? const [];
  bool hasRequestLanguage() => _requestLanguage != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _requestAvailability = getStructList(
      snapshotData['requestAvailability'],
      AvailabilityStruct.fromMap,
    );
    _requestLocationDecRef =
        snapshotData['requestLocationDecRef'] as DocumentReference?;
    _requestComment = snapshotData['requestComment'] as String?;
    _requestMinAge = castToType<int>(snapshotData['requestMinAge']);
    _requestMaxAge = castToType<int>(snapshotData['requestMaxAge']);
    _requestStatus = snapshotData['requestStatus'] is Status
        ? snapshotData['requestStatus']
        : deserializeEnum<Status>(snapshotData['requestStatus']);
    _requestTeacherDocRef =
        snapshotData['requestTeacherDocRef'] as DocumentReference?;
    _requestClassDayStart = snapshotData['requestClassDayStart'] as DateTime?;
    _requestLanguage = getDataList(snapshotData['requestLanguage']);
    _createdTime = snapshotData['createdTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RequestAvailability');

  static Stream<RequestAvailabilityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestAvailabilityRecord.fromSnapshot(s));

  static Future<RequestAvailabilityRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RequestAvailabilityRecord.fromSnapshot(s));

  static RequestAvailabilityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestAvailabilityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestAvailabilityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestAvailabilityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestAvailabilityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestAvailabilityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestAvailabilityRecordData({
  DocumentReference? requestLocationDecRef,
  String? requestComment,
  int? requestMinAge,
  int? requestMaxAge,
  Status? requestStatus,
  DocumentReference? requestTeacherDocRef,
  DateTime? requestClassDayStart,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'requestLocationDecRef': requestLocationDecRef,
      'requestComment': requestComment,
      'requestMinAge': requestMinAge,
      'requestMaxAge': requestMaxAge,
      'requestStatus': requestStatus,
      'requestTeacherDocRef': requestTeacherDocRef,
      'requestClassDayStart': requestClassDayStart,
      'createdTime': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestAvailabilityRecordDocumentEquality
    implements Equality<RequestAvailabilityRecord> {
  const RequestAvailabilityRecordDocumentEquality();

  @override
  bool equals(RequestAvailabilityRecord? e1, RequestAvailabilityRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.requestAvailability, e2?.requestAvailability) &&
        e1?.requestLocationDecRef == e2?.requestLocationDecRef &&
        e1?.requestComment == e2?.requestComment &&
        e1?.requestMinAge == e2?.requestMinAge &&
        e1?.requestMaxAge == e2?.requestMaxAge &&
        e1?.requestStatus == e2?.requestStatus &&
        e1?.requestTeacherDocRef == e2?.requestTeacherDocRef &&
        e1?.requestClassDayStart == e2?.requestClassDayStart &&
        listEquality.equals(e1?.requestLanguage, e2?.requestLanguage) &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(RequestAvailabilityRecord? e) => const ListEquality().hash([
        e?.requestAvailability,
        e?.requestLocationDecRef,
        e?.requestComment,
        e?.requestMinAge,
        e?.requestMaxAge,
        e?.requestStatus,
        e?.requestTeacherDocRef,
        e?.requestClassDayStart,
        e?.requestLanguage,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestAvailabilityRecord;
}
