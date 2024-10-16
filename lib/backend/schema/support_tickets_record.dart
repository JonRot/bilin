import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportTicketsRecord extends FirestoreRecord {
  SupportTicketsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "assignee" field.
  DocumentReference? _assignee;
  DocumentReference? get assignee => _assignee;
  bool hasAssignee() => _assignee != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "assignee2" field.
  DocumentReference? _assignee2;
  DocumentReference? get assignee2 => _assignee2;
  bool hasAssignee2() => _assignee2 != null;

  // "languageForChild" field.
  List<String>? _languageForChild;
  List<String> get languageForChild => _languageForChild ?? const [];
  bool hasLanguageForChild() => _languageForChild != null;

  // "aulaInteresse" field.
  String? _aulaInteresse;
  String get aulaInteresse => _aulaInteresse ?? '';
  bool hasAulaInteresse() => _aulaInteresse != null;

  // "aulaBairro" field.
  String? _aulaBairro;
  String get aulaBairro => _aulaBairro ?? '';
  bool hasAulaBairro() => _aulaBairro != null;

  // "isArchived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _assignee = snapshotData['assignee'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _assignee2 = snapshotData['assignee2'] as DocumentReference?;
    _languageForChild = getDataList(snapshotData['languageForChild']);
    _aulaInteresse = snapshotData['aulaInteresse'] as String?;
    _aulaBairro = snapshotData['aulaBairro'] as String?;
    _isArchived = snapshotData['isArchived'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supportTickets');

  static Stream<SupportTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportTicketsRecord.fromSnapshot(s));

  static Future<SupportTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportTicketsRecord.fromSnapshot(s));

  static SupportTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportTicketsRecordData({
  DocumentReference? owner,
  DocumentReference? assignee,
  String? description,
  DateTime? createdTime,
  String? image,
  DocumentReference? assignee2,
  String? aulaInteresse,
  String? aulaBairro,
  bool? isArchived,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'assignee': assignee,
      'description': description,
      'createdTime': createdTime,
      'image': image,
      'assignee2': assignee2,
      'aulaInteresse': aulaInteresse,
      'aulaBairro': aulaBairro,
      'isArchived': isArchived,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportTicketsRecordDocumentEquality
    implements Equality<SupportTicketsRecord> {
  const SupportTicketsRecordDocumentEquality();

  @override
  bool equals(SupportTicketsRecord? e1, SupportTicketsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.owner == e2?.owner &&
        e1?.assignee == e2?.assignee &&
        e1?.description == e2?.description &&
        e1?.createdTime == e2?.createdTime &&
        e1?.image == e2?.image &&
        e1?.assignee2 == e2?.assignee2 &&
        listEquality.equals(e1?.languageForChild, e2?.languageForChild) &&
        e1?.aulaInteresse == e2?.aulaInteresse &&
        e1?.aulaBairro == e2?.aulaBairro &&
        e1?.isArchived == e2?.isArchived;
  }

  @override
  int hash(SupportTicketsRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.assignee,
        e?.description,
        e?.createdTime,
        e?.image,
        e?.assignee2,
        e?.languageForChild,
        e?.aulaInteresse,
        e?.aulaBairro,
        e?.isArchived
      ]);

  @override
  bool isValidKey(Object? o) => o is SupportTicketsRecord;
}
