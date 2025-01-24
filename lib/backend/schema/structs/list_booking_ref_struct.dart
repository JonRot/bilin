// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListBookingRefStruct extends FFFirebaseStruct {
  ListBookingRefStruct({
    List<DocumentReference>? bookingRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bookingRef = bookingRef,
        super(firestoreUtilData);

  // "bookingRef" field.
  List<DocumentReference>? _bookingRef;
  List<DocumentReference> get bookingRef => _bookingRef ?? const [];
  set bookingRef(List<DocumentReference>? val) => _bookingRef = val;

  void updateBookingRef(Function(List<DocumentReference>) updateFn) {
    updateFn(_bookingRef ??= []);
  }

  bool hasBookingRef() => _bookingRef != null;

  static ListBookingRefStruct fromMap(Map<String, dynamic> data) =>
      ListBookingRefStruct(
        bookingRef: getDataList(data['bookingRef']),
      );

  static ListBookingRefStruct? maybeFromMap(dynamic data) => data is Map
      ? ListBookingRefStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bookingRef': _bookingRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bookingRef': serializeParam(
          _bookingRef,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static ListBookingRefStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListBookingRefStruct(
        bookingRef: deserializeParam<DocumentReference>(
          data['bookingRef'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['bookings'],
        ),
      );

  @override
  String toString() => 'ListBookingRefStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListBookingRefStruct &&
        listEquality.equals(bookingRef, other.bookingRef);
  }

  @override
  int get hashCode => const ListEquality().hash([bookingRef]);
}

ListBookingRefStruct createListBookingRefStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ListBookingRefStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ListBookingRefStruct? updateListBookingRefStruct(
  ListBookingRefStruct? listBookingRef, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    listBookingRef
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addListBookingRefStructData(
  Map<String, dynamic> firestoreData,
  ListBookingRefStruct? listBookingRef,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (listBookingRef == null) {
    return;
  }
  if (listBookingRef.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && listBookingRef.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final listBookingRefData =
      getListBookingRefFirestoreData(listBookingRef, forFieldValue);
  final nestedData =
      listBookingRefData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = listBookingRef.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getListBookingRefFirestoreData(
  ListBookingRefStruct? listBookingRef, [
  bool forFieldValue = false,
]) {
  if (listBookingRef == null) {
    return {};
  }
  final firestoreData = mapToFirestore(listBookingRef.toMap());

  // Add any Firestore field values
  listBookingRef.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getListBookingRefListFirestoreData(
  List<ListBookingRefStruct>? listBookingRefs,
) =>
    listBookingRefs
        ?.map((e) => getListBookingRefFirestoreData(e, true))
        .toList() ??
    [];
