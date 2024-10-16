import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "detectedKeywords" field.
  List<String>? _detectedKeywords;
  List<String> get detectedKeywords => _detectedKeywords ?? const [];
  bool hasDetectedKeywords() => _detectedKeywords != null;

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "messageID" field.
  DocumentReference? _messageID;
  DocumentReference? get messageID => _messageID;
  bool hasMessageID() => _messageID != null;

  void _initializeFields() {
    _detectedKeywords = getDataList(snapshotData['detectedKeywords']);
    _messageText = snapshotData['messageText'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _messageID = snapshotData['messageID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? messageText,
  DateTime? timestamp,
  DocumentReference? messageID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'messageText': messageText,
      'timestamp': timestamp,
      'messageID': messageID,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.detectedKeywords, e2?.detectedKeywords) &&
        e1?.messageText == e2?.messageText &&
        e1?.timestamp == e2?.timestamp &&
        e1?.messageID == e2?.messageID;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality()
      .hash([e?.detectedKeywords, e?.messageText, e?.timestamp, e?.messageID]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
