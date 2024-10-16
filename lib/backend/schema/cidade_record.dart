import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CidadeRecord extends FirestoreRecord {
  CidadeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "latLong" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  bool hasLatLong() => _latLong != null;

  // "nomeRua" field.
  String? _nomeRua;
  String get nomeRua => _nomeRua ?? '';
  bool hasNomeRua() => _nomeRua != null;

  // "enderecoCompleto" field.
  String? _enderecoCompleto;
  String get enderecoCompleto => _enderecoCompleto ?? '';
  bool hasEnderecoCompleto() => _enderecoCompleto != null;

  // "Complemento" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  bool hasComplemento() => _complemento != null;

  // "userRefCidade" field.
  DocumentReference? _userRefCidade;
  DocumentReference? get userRefCidade => _userRefCidade;
  bool hasUserRefCidade() => _userRefCidade != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "isDefault" field.
  bool? _isDefault;
  bool get isDefault => _isDefault ?? false;
  bool hasIsDefault() => _isDefault != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  bool hasBairro() => _bairro != null;

  // "uni" field.
  String? _uni;
  String get uni => _uni ?? '';
  bool hasUni() => _uni != null;

  // "numero" field.
  int? _numero;
  int get numero => _numero ?? 0;
  bool hasNumero() => _numero != null;

  void _initializeFields() {
    _cidade = snapshotData['cidade'] as String?;
    _estado = snapshotData['estado'] as String?;
    _cep = snapshotData['cep'] as String?;
    _latLong = snapshotData['latLong'] as LatLng?;
    _nomeRua = snapshotData['nomeRua'] as String?;
    _enderecoCompleto = snapshotData['enderecoCompleto'] as String?;
    _complemento = snapshotData['Complemento'] as String?;
    _userRefCidade = snapshotData['userRefCidade'] as DocumentReference?;
    _titulo = snapshotData['titulo'] as String?;
    _isDefault = snapshotData['isDefault'] as bool?;
    _bairro = snapshotData['bairro'] as String?;
    _uni = snapshotData['uni'] as String?;
    _numero = castToType<int>(snapshotData['numero']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cidade');

  static Stream<CidadeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CidadeRecord.fromSnapshot(s));

  static Future<CidadeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CidadeRecord.fromSnapshot(s));

  static CidadeRecord fromSnapshot(DocumentSnapshot snapshot) => CidadeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CidadeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CidadeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CidadeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CidadeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCidadeRecordData({
  String? cidade,
  String? estado,
  String? cep,
  LatLng? latLong,
  String? nomeRua,
  String? enderecoCompleto,
  String? complemento,
  DocumentReference? userRefCidade,
  String? titulo,
  bool? isDefault,
  String? bairro,
  String? uni,
  int? numero,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
      'latLong': latLong,
      'nomeRua': nomeRua,
      'enderecoCompleto': enderecoCompleto,
      'Complemento': complemento,
      'userRefCidade': userRefCidade,
      'titulo': titulo,
      'isDefault': isDefault,
      'bairro': bairro,
      'uni': uni,
      'numero': numero,
    }.withoutNulls,
  );

  return firestoreData;
}

class CidadeRecordDocumentEquality implements Equality<CidadeRecord> {
  const CidadeRecordDocumentEquality();

  @override
  bool equals(CidadeRecord? e1, CidadeRecord? e2) {
    return e1?.cidade == e2?.cidade &&
        e1?.estado == e2?.estado &&
        e1?.cep == e2?.cep &&
        e1?.latLong == e2?.latLong &&
        e1?.nomeRua == e2?.nomeRua &&
        e1?.enderecoCompleto == e2?.enderecoCompleto &&
        e1?.complemento == e2?.complemento &&
        e1?.userRefCidade == e2?.userRefCidade &&
        e1?.titulo == e2?.titulo &&
        e1?.isDefault == e2?.isDefault &&
        e1?.bairro == e2?.bairro &&
        e1?.uni == e2?.uni &&
        e1?.numero == e2?.numero;
  }

  @override
  int hash(CidadeRecord? e) => const ListEquality().hash([
        e?.cidade,
        e?.estado,
        e?.cep,
        e?.latLong,
        e?.nomeRua,
        e?.enderecoCompleto,
        e?.complemento,
        e?.userRefCidade,
        e?.titulo,
        e?.isDefault,
        e?.bairro,
        e?.uni,
        e?.numero
      ]);

  @override
  bool isValidKey(Object? o) => o is CidadeRecord;
}
