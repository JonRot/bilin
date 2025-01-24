import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bookingDayOfWeek" field.
  String? _bookingDayOfWeek;
  String get bookingDayOfWeek => _bookingDayOfWeek ?? '';
  bool hasBookingDayOfWeek() => _bookingDayOfWeek != null;

  // "bookingTime" field.
  DateTime? _bookingTime;
  DateTime? get bookingTime => _bookingTime;
  bool hasBookingTime() => _bookingTime != null;

  // "bookingStudentRef" field.
  DocumentReference? _bookingStudentRef;
  DocumentReference? get bookingStudentRef => _bookingStudentRef;
  bool hasBookingStudentRef() => _bookingStudentRef != null;

  // "bookingTeacherRef" field.
  DocumentReference? _bookingTeacherRef;
  DocumentReference? get bookingTeacherRef => _bookingTeacherRef;
  bool hasBookingTeacherRef() => _bookingTeacherRef != null;

  // "bookingTeacherLocal" field.
  String? _bookingTeacherLocal;
  String get bookingTeacherLocal => _bookingTeacherLocal ?? '';
  bool hasBookingTeacherLocal() => _bookingTeacherLocal != null;

  // "bookingStudentLocal" field.
  String? _bookingStudentLocal;
  String get bookingStudentLocal => _bookingStudentLocal ?? '';
  bool hasBookingStudentLocal() => _bookingStudentLocal != null;

  // "bookingParentRef" field.
  DocumentReference? _bookingParentRef;
  DocumentReference? get bookingParentRef => _bookingParentRef;
  bool hasBookingParentRef() => _bookingParentRef != null;

  // "bookingRecords" field.
  List<DateTime>? _bookingRecords;
  List<DateTime> get bookingRecords => _bookingRecords ?? const [];
  bool hasBookingRecords() => _bookingRecords != null;

  // "bookingActive" field.
  bool? _bookingActive;
  bool get bookingActive => _bookingActive ?? false;
  bool hasBookingActive() => _bookingActive != null;

  // "bookingCreatedDateTime" field.
  DateTime? _bookingCreatedDateTime;
  DateTime? get bookingCreatedDateTime => _bookingCreatedDateTime;
  bool hasBookingCreatedDateTime() => _bookingCreatedDateTime != null;

  // "bookingExceptionDays" field.
  List<DateTime>? _bookingExceptionDays;
  List<DateTime> get bookingExceptionDays => _bookingExceptionDays ?? const [];
  bool hasBookingExceptionDays() => _bookingExceptionDays != null;

  void _initializeFields() {
    _bookingDayOfWeek = snapshotData['bookingDayOfWeek'] as String?;
    _bookingTime = snapshotData['bookingTime'] as DateTime?;
    _bookingStudentRef =
        snapshotData['bookingStudentRef'] as DocumentReference?;
    _bookingTeacherRef =
        snapshotData['bookingTeacherRef'] as DocumentReference?;
    _bookingTeacherLocal = snapshotData['bookingTeacherLocal'] as String?;
    _bookingStudentLocal = snapshotData['bookingStudentLocal'] as String?;
    _bookingParentRef = snapshotData['bookingParentRef'] as DocumentReference?;
    _bookingRecords = getDataList(snapshotData['bookingRecords']);
    _bookingActive = snapshotData['bookingActive'] as bool?;
    _bookingCreatedDateTime =
        snapshotData['bookingCreatedDateTime'] as DateTime?;
    _bookingExceptionDays = getDataList(snapshotData['bookingExceptionDays']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  String? bookingDayOfWeek,
  DateTime? bookingTime,
  DocumentReference? bookingStudentRef,
  DocumentReference? bookingTeacherRef,
  String? bookingTeacherLocal,
  String? bookingStudentLocal,
  DocumentReference? bookingParentRef,
  bool? bookingActive,
  DateTime? bookingCreatedDateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bookingDayOfWeek': bookingDayOfWeek,
      'bookingTime': bookingTime,
      'bookingStudentRef': bookingStudentRef,
      'bookingTeacherRef': bookingTeacherRef,
      'bookingTeacherLocal': bookingTeacherLocal,
      'bookingStudentLocal': bookingStudentLocal,
      'bookingParentRef': bookingParentRef,
      'bookingActive': bookingActive,
      'bookingCreatedDateTime': bookingCreatedDateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookingDayOfWeek == e2?.bookingDayOfWeek &&
        e1?.bookingTime == e2?.bookingTime &&
        e1?.bookingStudentRef == e2?.bookingStudentRef &&
        e1?.bookingTeacherRef == e2?.bookingTeacherRef &&
        e1?.bookingTeacherLocal == e2?.bookingTeacherLocal &&
        e1?.bookingStudentLocal == e2?.bookingStudentLocal &&
        e1?.bookingParentRef == e2?.bookingParentRef &&
        listEquality.equals(e1?.bookingRecords, e2?.bookingRecords) &&
        e1?.bookingActive == e2?.bookingActive &&
        e1?.bookingCreatedDateTime == e2?.bookingCreatedDateTime &&
        listEquality.equals(e1?.bookingExceptionDays, e2?.bookingExceptionDays);
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.bookingDayOfWeek,
        e?.bookingTime,
        e?.bookingStudentRef,
        e?.bookingTeacherRef,
        e?.bookingTeacherLocal,
        e?.bookingStudentLocal,
        e?.bookingParentRef,
        e?.bookingRecords,
        e?.bookingActive,
        e?.bookingCreatedDateTime,
        e?.bookingExceptionDays
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
