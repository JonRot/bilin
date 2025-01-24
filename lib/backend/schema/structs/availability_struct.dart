// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AvailabilityStruct extends FFFirebaseStruct {
  AvailabilityStruct({
    String? dayofWeek,
    DateTime? startTime,
    DateTime? endTime,
    String? local,
    DocumentReference? teacherDocRef,
    DateTime? studentBookings,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dayofWeek = dayofWeek,
        _startTime = startTime,
        _endTime = endTime,
        _local = local,
        _teacherDocRef = teacherDocRef,
        _studentBookings = studentBookings,
        super(firestoreUtilData);

  // "dayofWeek" field.
  String? _dayofWeek;
  String get dayofWeek => _dayofWeek ?? '';
  set dayofWeek(String? val) => _dayofWeek = val;

  bool hasDayofWeek() => _dayofWeek != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "local" field.
  String? _local;
  String get local => _local ?? '';
  set local(String? val) => _local = val;

  bool hasLocal() => _local != null;

  // "teacherDocRef" field.
  DocumentReference? _teacherDocRef;
  DocumentReference? get teacherDocRef => _teacherDocRef;
  set teacherDocRef(DocumentReference? val) => _teacherDocRef = val;

  bool hasTeacherDocRef() => _teacherDocRef != null;

  // "studentBookings" field.
  DateTime? _studentBookings;
  DateTime? get studentBookings => _studentBookings;
  set studentBookings(DateTime? val) => _studentBookings = val;

  bool hasStudentBookings() => _studentBookings != null;

  static AvailabilityStruct fromMap(Map<String, dynamic> data) =>
      AvailabilityStruct(
        dayofWeek: data['dayofWeek'] as String?,
        startTime: data['startTime'] as DateTime?,
        endTime: data['endTime'] as DateTime?,
        local: data['local'] as String?,
        teacherDocRef: data['teacherDocRef'] as DocumentReference?,
        studentBookings: data['studentBookings'] as DateTime?,
      );

  static AvailabilityStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailabilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dayofWeek': _dayofWeek,
        'startTime': _startTime,
        'endTime': _endTime,
        'local': _local,
        'teacherDocRef': _teacherDocRef,
        'studentBookings': _studentBookings,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dayofWeek': serializeParam(
          _dayofWeek,
          ParamType.String,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
        'local': serializeParam(
          _local,
          ParamType.String,
        ),
        'teacherDocRef': serializeParam(
          _teacherDocRef,
          ParamType.DocumentReference,
        ),
        'studentBookings': serializeParam(
          _studentBookings,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AvailabilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailabilityStruct(
        dayofWeek: deserializeParam(
          data['dayofWeek'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
        local: deserializeParam(
          data['local'],
          ParamType.String,
          false,
        ),
        teacherDocRef: deserializeParam(
          data['teacherDocRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        studentBookings: deserializeParam(
          data['studentBookings'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AvailabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvailabilityStruct &&
        dayofWeek == other.dayofWeek &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        local == other.local &&
        teacherDocRef == other.teacherDocRef &&
        studentBookings == other.studentBookings;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [dayofWeek, startTime, endTime, local, teacherDocRef, studentBookings]);
}

AvailabilityStruct createAvailabilityStruct({
  String? dayofWeek,
  DateTime? startTime,
  DateTime? endTime,
  String? local,
  DocumentReference? teacherDocRef,
  DateTime? studentBookings,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvailabilityStruct(
      dayofWeek: dayofWeek,
      startTime: startTime,
      endTime: endTime,
      local: local,
      teacherDocRef: teacherDocRef,
      studentBookings: studentBookings,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvailabilityStruct? updateAvailabilityStruct(
  AvailabilityStruct? availability, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    availability
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvailabilityStructData(
  Map<String, dynamic> firestoreData,
  AvailabilityStruct? availability,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (availability == null) {
    return;
  }
  if (availability.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && availability.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final availabilityData =
      getAvailabilityFirestoreData(availability, forFieldValue);
  final nestedData =
      availabilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = availability.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvailabilityFirestoreData(
  AvailabilityStruct? availability, [
  bool forFieldValue = false,
]) {
  if (availability == null) {
    return {};
  }
  final firestoreData = mapToFirestore(availability.toMap());

  // Add any Firestore field values
  availability.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvailabilityListFirestoreData(
  List<AvailabilityStruct>? availabilitys,
) =>
    availabilitys?.map((e) => getAvailabilityFirestoreData(e, true)).toList() ??
    [];
