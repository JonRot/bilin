import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

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

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  void _initializeFields() {
    _detectedKeywords = getDataList(snapshotData['detectedKeywords']);
    _messageText = snapshotData['messageText'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _messageID = snapshotData['messageID'] as DocumentReference?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
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
  DocumentReference? senderRef,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'messageText': messageText,
      'timestamp': timestamp,
      'messageID': messageID,
      'senderRef': senderRef,
      'chatRef': chatRef,
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
        e1?.messageID == e2?.messageID &&
        e1?.senderRef == e2?.senderRef &&
        e1?.chatRef == e2?.chatRef;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.detectedKeywords,
        e?.messageText,
        e?.timestamp,
        e?.messageID,
        e?.senderRef,
        e?.chatRef
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
