import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingFeedbackRecord extends FirestoreRecord {
  BookingFeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bFeedDateTime" field.
  DateTime? _bFeedDateTime;
  DateTime? get bFeedDateTime => _bFeedDateTime;
  bool hasBFeedDateTime() => _bFeedDateTime != null;

  // "bFeedFeedback" field.
  String? _bFeedFeedback;
  String get bFeedFeedback => _bFeedFeedback ?? '';
  bool hasBFeedFeedback() => _bFeedFeedback != null;

  // "bFeedAttendance" field.
  Attendance? _bFeedAttendance;
  Attendance? get bFeedAttendance => _bFeedAttendance;
  bool hasBFeedAttendance() => _bFeedAttendance != null;

  // "bFeedImages" field.
  List<String>? _bFeedImages;
  List<String> get bFeedImages => _bFeedImages ?? const [];
  bool hasBFeedImages() => _bFeedImages != null;

  // "bFeedDayTime" field.
  String? _bFeedDayTime;
  String get bFeedDayTime => _bFeedDayTime ?? '';
  bool hasBFeedDayTime() => _bFeedDayTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bFeedDateTime = snapshotData['bFeedDateTime'] as DateTime?;
    _bFeedFeedback = snapshotData['bFeedFeedback'] as String?;
    _bFeedAttendance = snapshotData['bFeedAttendance'] is Attendance
        ? snapshotData['bFeedAttendance']
        : deserializeEnum<Attendance>(snapshotData['bFeedAttendance']);
    _bFeedImages = getDataList(snapshotData['bFeedImages']);
    _bFeedDayTime = snapshotData['bFeedDayTime'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookingFeedback')
          : FirebaseFirestore.instance.collectionGroup('bookingFeedback');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookingFeedback').doc(id);

  static Stream<BookingFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingFeedbackRecord.fromSnapshot(s));

  static Future<BookingFeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingFeedbackRecord.fromSnapshot(s));

  static BookingFeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingFeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingFeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingFeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingFeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingFeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingFeedbackRecordData({
  DateTime? bFeedDateTime,
  String? bFeedFeedback,
  Attendance? bFeedAttendance,
  String? bFeedDayTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bFeedDateTime': bFeedDateTime,
      'bFeedFeedback': bFeedFeedback,
      'bFeedAttendance': bFeedAttendance,
      'bFeedDayTime': bFeedDayTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingFeedbackRecordDocumentEquality
    implements Equality<BookingFeedbackRecord> {
  const BookingFeedbackRecordDocumentEquality();

  @override
  bool equals(BookingFeedbackRecord? e1, BookingFeedbackRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bFeedDateTime == e2?.bFeedDateTime &&
        e1?.bFeedFeedback == e2?.bFeedFeedback &&
        e1?.bFeedAttendance == e2?.bFeedAttendance &&
        listEquality.equals(e1?.bFeedImages, e2?.bFeedImages) &&
        e1?.bFeedDayTime == e2?.bFeedDayTime;
  }

  @override
  int hash(BookingFeedbackRecord? e) => const ListEquality().hash([
        e?.bFeedDateTime,
        e?.bFeedFeedback,
        e?.bFeedAttendance,
        e?.bFeedImages,
        e?.bFeedDayTime
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingFeedbackRecord;
}
