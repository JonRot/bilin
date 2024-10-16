import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _messageReaction = false;
  bool get messageReaction => _messageReaction;
  set messageReaction(bool value) {
    _messageReaction = value;
  }

  String _messageFocusText = '';
  String get messageFocusText => _messageFocusText;
  set messageFocusText(String value) {
    _messageFocusText = value;
  }

  bool _messageFocusColor = false;
  bool get messageFocusColor => _messageFocusColor;
  set messageFocusColor(bool value) {
    _messageFocusColor = value;
  }

  bool _SearchChat = false;
  bool get SearchChat => _SearchChat;
  set SearchChat(bool value) {
    _SearchChat = value;
  }

  bool _isChatShown = false;
  bool get isChatShown => _isChatShown;
  set isChatShown(bool value) {
    _isChatShown = value;
  }

  bool _alunoFaltou = false;
  bool get alunoFaltou => _alunoFaltou;
  set alunoFaltou(bool value) {
    _alunoFaltou = value;
  }

  String _enderecoCompleto = '';
  String get enderecoCompleto => _enderecoCompleto;
  set enderecoCompleto(String value) {
    _enderecoCompleto = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);

  final _appointmentAgendaManager =
      StreamRequestManager<List<AppointmentsRecord>>();
  Stream<List<AppointmentsRecord>> appointmentAgenda({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<AppointmentsRecord>> Function() requestFn,
  }) =>
      _appointmentAgendaManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAppointmentAgendaCache() => _appointmentAgendaManager.clear();
  void clearAppointmentAgendaCacheKey(String? uniqueKey) =>
      _appointmentAgendaManager.clearRequest(uniqueKey);
}
