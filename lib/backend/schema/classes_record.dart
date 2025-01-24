import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesRecord extends FirestoreRecord {
  ClassesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "classAvailability" field.
  List<AvailabilityStruct>? _classAvailability;
  List<AvailabilityStruct> get classAvailability =>
      _classAvailability ?? const [];
  bool hasClassAvailability() => _classAvailability != null;

  // "classLocationRf" field.
  DocumentReference? _classLocationRf;
  DocumentReference? get classLocationRf => _classLocationRf;
  bool hasClassLocationRf() => _classLocationRf != null;

  // "classRecado" field.
  String? _classRecado;
  String get classRecado => _classRecado ?? '';
  bool hasClassRecado() => _classRecado != null;

  // "classIdadeMinima" field.
  int? _classIdadeMinima;
  int get classIdadeMinima => _classIdadeMinima ?? 0;
  bool hasClassIdadeMinima() => _classIdadeMinima != null;

  // "classIdadeMaxima" field.
  int? _classIdadeMaxima;
  int get classIdadeMaxima => _classIdadeMaxima ?? 0;
  bool hasClassIdadeMaxima() => _classIdadeMaxima != null;

  // "classTeacherDocRef" field.
  DocumentReference? _classTeacherDocRef;
  DocumentReference? get classTeacherDocRef => _classTeacherDocRef;
  bool hasClassTeacherDocRef() => _classTeacherDocRef != null;

  // "classDayStart" field.
  DateTime? _classDayStart;
  DateTime? get classDayStart => _classDayStart;
  bool hasClassDayStart() => _classDayStart != null;

  // "classLanguage" field.
  List<String>? _classLanguage;
  List<String> get classLanguage => _classLanguage ?? const [];
  bool hasClassLanguage() => _classLanguage != null;

  // "classRequestAvailabilityRef" field.
  DocumentReference? _classRequestAvailabilityRef;
  DocumentReference? get classRequestAvailabilityRef =>
      _classRequestAvailabilityRef;
  bool hasClassRequestAvailabilityRef() => _classRequestAvailabilityRef != null;

  // "classesTimeA_B" field.
  int? _classesTimeAB;
  int get classesTimeAB => _classesTimeAB ?? 0;
  bool hasClassesTimeAB() => _classesTimeAB != null;

  // "classesBookingRef" field.
  ListBookingRefStruct? _classesBookingRef;
  ListBookingRefStruct get classesBookingRef =>
      _classesBookingRef ?? ListBookingRefStruct();
  bool hasClassesBookingRef() => _classesBookingRef != null;

  void _initializeFields() {
    _classAvailability = getStructList(
      snapshotData['classAvailability'],
      AvailabilityStruct.fromMap,
    );
    _classLocationRf = snapshotData['classLocationRf'] as DocumentReference?;
    _classRecado = snapshotData['classRecado'] as String?;
    _classIdadeMinima = castToType<int>(snapshotData['classIdadeMinima']);
    _classIdadeMaxima = castToType<int>(snapshotData['classIdadeMaxima']);
    _classTeacherDocRef =
        snapshotData['classTeacherDocRef'] as DocumentReference?;
    _classDayStart = snapshotData['classDayStart'] as DateTime?;
    _classLanguage = getDataList(snapshotData['classLanguage']);
    _classRequestAvailabilityRef =
        snapshotData['classRequestAvailabilityRef'] as DocumentReference?;
    _classesTimeAB = castToType<int>(snapshotData['classesTimeA_B']);
    _classesBookingRef = snapshotData['classesBookingRef']
            is ListBookingRefStruct
        ? snapshotData['classesBookingRef']
        : ListBookingRefStruct.maybeFromMap(snapshotData['classesBookingRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classes');

  static Stream<ClassesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesRecord.fromSnapshot(s));

  static Future<ClassesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassesRecord.fromSnapshot(s));

  static ClassesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassesRecordData({
  DocumentReference? classLocationRf,
  String? classRecado,
  int? classIdadeMinima,
  int? classIdadeMaxima,
  DocumentReference? classTeacherDocRef,
  DateTime? classDayStart,
  DocumentReference? classRequestAvailabilityRef,
  int? classesTimeAB,
  ListBookingRefStruct? classesBookingRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'classLocationRf': classLocationRf,
      'classRecado': classRecado,
      'classIdadeMinima': classIdadeMinima,
      'classIdadeMaxima': classIdadeMaxima,
      'classTeacherDocRef': classTeacherDocRef,
      'classDayStart': classDayStart,
      'classRequestAvailabilityRef': classRequestAvailabilityRef,
      'classesTimeA_B': classesTimeAB,
      'classesBookingRef': ListBookingRefStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "classesBookingRef" field.
  addListBookingRefStructData(
      firestoreData, classesBookingRef, 'classesBookingRef');

  return firestoreData;
}

class ClassesRecordDocumentEquality implements Equality<ClassesRecord> {
  const ClassesRecordDocumentEquality();

  @override
  bool equals(ClassesRecord? e1, ClassesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.classAvailability, e2?.classAvailability) &&
        e1?.classLocationRf == e2?.classLocationRf &&
        e1?.classRecado == e2?.classRecado &&
        e1?.classIdadeMinima == e2?.classIdadeMinima &&
        e1?.classIdadeMaxima == e2?.classIdadeMaxima &&
        e1?.classTeacherDocRef == e2?.classTeacherDocRef &&
        e1?.classDayStart == e2?.classDayStart &&
        listEquality.equals(e1?.classLanguage, e2?.classLanguage) &&
        e1?.classRequestAvailabilityRef == e2?.classRequestAvailabilityRef &&
        e1?.classesTimeAB == e2?.classesTimeAB &&
        e1?.classesBookingRef == e2?.classesBookingRef;
  }

  @override
  int hash(ClassesRecord? e) => const ListEquality().hash([
        e?.classAvailability,
        e?.classLocationRf,
        e?.classRecado,
        e?.classIdadeMinima,
        e?.classIdadeMaxima,
        e?.classTeacherDocRef,
        e?.classDayStart,
        e?.classLanguage,
        e?.classRequestAvailabilityRef,
        e?.classesTimeAB,
        e?.classesBookingRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ClassesRecord;
}
