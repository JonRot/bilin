import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "appointmentAlunoID" field.
  DocumentReference? _appointmentAlunoID;
  DocumentReference? get appointmentAlunoID => _appointmentAlunoID;
  bool hasAppointmentAlunoID() => _appointmentAlunoID != null;

  // "appointmentTeacher" field.
  DocumentReference? _appointmentTeacher;
  DocumentReference? get appointmentTeacher => _appointmentTeacher;
  bool hasAppointmentTeacher() => _appointmentTeacher != null;

  // "appointmentLocation" field.
  String? _appointmentLocation;
  String get appointmentLocation => _appointmentLocation ?? '';
  bool hasAppointmentLocation() => _appointmentLocation != null;

  // "appointmentLanguage" field.
  List<String>? _appointmentLanguage;
  List<String> get appointmentLanguage => _appointmentLanguage ?? const [];
  bool hasAppointmentLanguage() => _appointmentLanguage != null;

  // "appointmentParent" field.
  DocumentReference? _appointmentParent;
  DocumentReference? get appointmentParent => _appointmentParent;
  bool hasAppointmentParent() => _appointmentParent != null;

  // "appointmentRole" field.
  Role? _appointmentRole;
  Role? get appointmentRole => _appointmentRole;
  bool hasAppointmentRole() => _appointmentRole != null;

  // "repeatEveryTwoWeeks" field.
  bool? _repeatEveryTwoWeeks;
  bool get repeatEveryTwoWeeks => _repeatEveryTwoWeeks ?? false;
  bool hasRepeatEveryTwoWeeks() => _repeatEveryTwoWeeks != null;

  // "deleteFutureAppointmentsFlag" field.
  bool? _deleteFutureAppointmentsFlag;
  bool get deleteFutureAppointmentsFlag =>
      _deleteFutureAppointmentsFlag ?? false;
  bool hasDeleteFutureAppointmentsFlag() =>
      _deleteFutureAppointmentsFlag != null;

  // "appointmentDate" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "appointmentRepeat" field.
  bool? _appointmentRepeat;
  bool get appointmentRepeat => _appointmentRepeat ?? false;
  bool hasAppointmentRepeat() => _appointmentRepeat != null;

  // "appointmentProcessed" field.
  bool? _appointmentProcessed;
  bool get appointmentProcessed => _appointmentProcessed ?? false;
  bool hasAppointmentProcessed() => _appointmentProcessed != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "nomeTeacher" field.
  String? _nomeTeacher;
  String get nomeTeacher => _nomeTeacher ?? '';
  bool hasNomeTeacher() => _nomeTeacher != null;

  // "alunoFoto" field.
  String? _alunoFoto;
  String get alunoFoto => _alunoFoto ?? '';
  bool hasAlunoFoto() => _alunoFoto != null;

  // "presenca" field.
  String? _presenca;
  String get presenca => _presenca ?? '';
  bool hasPresenca() => _presenca != null;

  // "uniqueCombinations" field.
  String? _uniqueCombinations;
  String get uniqueCombinations => _uniqueCombinations ?? '';
  bool hasUniqueCombinations() => _uniqueCombinations != null;

  // "recurrenceRule" field.
  String? _recurrenceRule;
  String get recurrenceRule => _recurrenceRule ?? '';
  bool hasRecurrenceRule() => _recurrenceRule != null;

  void _initializeFields() {
    _appointmentAlunoID =
        snapshotData['appointmentAlunoID'] as DocumentReference?;
    _appointmentTeacher =
        snapshotData['appointmentTeacher'] as DocumentReference?;
    _appointmentLocation = snapshotData['appointmentLocation'] as String?;
    _appointmentLanguage = getDataList(snapshotData['appointmentLanguage']);
    _appointmentParent =
        snapshotData['appointmentParent'] as DocumentReference?;
    _appointmentRole = deserializeEnum<Role>(snapshotData['appointmentRole']);
    _repeatEveryTwoWeeks = snapshotData['repeatEveryTwoWeeks'] as bool?;
    _deleteFutureAppointmentsFlag =
        snapshotData['deleteFutureAppointmentsFlag'] as bool?;
    _appointmentDate = snapshotData['appointmentDate'] as DateTime?;
    _appointmentRepeat = snapshotData['appointmentRepeat'] as bool?;
    _appointmentProcessed = snapshotData['appointmentProcessed'] as bool?;
    _subject = snapshotData['subject'] as String?;
    _nomeTeacher = snapshotData['nomeTeacher'] as String?;
    _alunoFoto = snapshotData['alunoFoto'] as String?;
    _presenca = snapshotData['presenca'] as String?;
    _uniqueCombinations = snapshotData['uniqueCombinations'] as String?;
    _recurrenceRule = snapshotData['recurrenceRule'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  DocumentReference? appointmentAlunoID,
  DocumentReference? appointmentTeacher,
  String? appointmentLocation,
  DocumentReference? appointmentParent,
  Role? appointmentRole,
  bool? repeatEveryTwoWeeks,
  bool? deleteFutureAppointmentsFlag,
  DateTime? appointmentDate,
  bool? appointmentRepeat,
  bool? appointmentProcessed,
  String? subject,
  String? nomeTeacher,
  String? alunoFoto,
  String? presenca,
  String? uniqueCombinations,
  String? recurrenceRule,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'appointmentAlunoID': appointmentAlunoID,
      'appointmentTeacher': appointmentTeacher,
      'appointmentLocation': appointmentLocation,
      'appointmentParent': appointmentParent,
      'appointmentRole': appointmentRole,
      'repeatEveryTwoWeeks': repeatEveryTwoWeeks,
      'deleteFutureAppointmentsFlag': deleteFutureAppointmentsFlag,
      'appointmentDate': appointmentDate,
      'appointmentRepeat': appointmentRepeat,
      'appointmentProcessed': appointmentProcessed,
      'subject': subject,
      'nomeTeacher': nomeTeacher,
      'alunoFoto': alunoFoto,
      'presenca': presenca,
      'uniqueCombinations': uniqueCombinations,
      'recurrenceRule': recurrenceRule,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.appointmentAlunoID == e2?.appointmentAlunoID &&
        e1?.appointmentTeacher == e2?.appointmentTeacher &&
        e1?.appointmentLocation == e2?.appointmentLocation &&
        listEquality.equals(e1?.appointmentLanguage, e2?.appointmentLanguage) &&
        e1?.appointmentParent == e2?.appointmentParent &&
        e1?.appointmentRole == e2?.appointmentRole &&
        e1?.repeatEveryTwoWeeks == e2?.repeatEveryTwoWeeks &&
        e1?.deleteFutureAppointmentsFlag == e2?.deleteFutureAppointmentsFlag &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.appointmentRepeat == e2?.appointmentRepeat &&
        e1?.appointmentProcessed == e2?.appointmentProcessed &&
        e1?.subject == e2?.subject &&
        e1?.nomeTeacher == e2?.nomeTeacher &&
        e1?.alunoFoto == e2?.alunoFoto &&
        e1?.presenca == e2?.presenca &&
        e1?.uniqueCombinations == e2?.uniqueCombinations &&
        e1?.recurrenceRule == e2?.recurrenceRule;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.appointmentAlunoID,
        e?.appointmentTeacher,
        e?.appointmentLocation,
        e?.appointmentLanguage,
        e?.appointmentParent,
        e?.appointmentRole,
        e?.repeatEveryTwoWeeks,
        e?.deleteFutureAppointmentsFlag,
        e?.appointmentDate,
        e?.appointmentRepeat,
        e?.appointmentProcessed,
        e?.subject,
        e?.nomeTeacher,
        e?.alunoFoto,
        e?.presenca,
        e?.uniqueCombinations,
        e?.recurrenceRule
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
