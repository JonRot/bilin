import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _messageNumberCount =
          prefs.getString('ff_messageNumberCount') ?? _messageNumberCount;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _unreadMessageCount = 0;
  int get unreadMessageCount => _unreadMessageCount;
  set unreadMessageCount(int value) {
    _unreadMessageCount = value;
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

  bool _alunoFaltou = false;
  bool get alunoFaltou => _alunoFaltou;
  set alunoFaltou(bool value) {
    _alunoFaltou = value;
  }

  DateTime? _time = DateTime.fromMillisecondsSinceEpoch(54000000);
  DateTime? get time => _time;
  set time(DateTime? value) {
    _time = value;
  }

  List<AvailabilityStruct> _availability = [];
  List<AvailabilityStruct> get availability => _availability;
  set availability(List<AvailabilityStruct> value) {
    _availability = value;
  }

  void addToAvailability(AvailabilityStruct value) {
    availability.add(value);
  }

  void removeFromAvailability(AvailabilityStruct value) {
    availability.remove(value);
  }

  void removeAtIndexFromAvailability(int index) {
    availability.removeAt(index);
  }

  void updateAvailabilityAtIndex(
    int index,
    AvailabilityStruct Function(AvailabilityStruct) updateFn,
  ) {
    availability[index] = updateFn(_availability[index]);
  }

  void insertAtIndexInAvailability(int index, AvailabilityStruct value) {
    availability.insert(index, value);
  }

  String _LocalRequester = '';
  String get LocalRequester => _LocalRequester;
  set LocalRequester(String value) {
    _LocalRequester = value;
  }

  List<bool> _selectedBTN = [];
  List<bool> get selectedBTN => _selectedBTN;
  set selectedBTN(List<bool> value) {
    _selectedBTN = value;
  }

  void addToSelectedBTN(bool value) {
    selectedBTN.add(value);
  }

  void removeFromSelectedBTN(bool value) {
    selectedBTN.remove(value);
  }

  void removeAtIndexFromSelectedBTN(int index) {
    selectedBTN.removeAt(index);
  }

  void updateSelectedBTNAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    selectedBTN[index] = updateFn(_selectedBTN[index]);
  }

  void insertAtIndexInSelectedBTN(int index, bool value) {
    selectedBTN.insert(index, value);
  }

  String _APIMode = 'driving';
  String get APIMode => _APIMode;
  set APIMode(String value) {
    _APIMode = value;
  }

  String _apiLocation = '';
  String get apiLocation => _apiLocation;
  set apiLocation(String value) {
    _apiLocation = value;
  }

  int _teacherDistanceTime = 15;
  int get teacherDistanceTime => _teacherDistanceTime;
  set teacherDistanceTime(int value) {
    _teacherDistanceTime = value;
  }

  String _messageNumberCount = '';
  String get messageNumberCount => _messageNumberCount;
  set messageNumberCount(String value) {
    _messageNumberCount = value;
    prefs.setString('ff_messageNumberCount', value);
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

  final _adminUsersManager = FutureRequestManager<List<UsersRecord>>();
  Future<List<UsersRecord>> adminUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRecord>> Function() requestFn,
  }) =>
      _adminUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAdminUsersCache() => _adminUsersManager.clear();
  void clearAdminUsersCacheKey(String? uniqueKey) =>
      _adminUsersManager.clearRequest(uniqueKey);

  final _presentNumManager = FutureRequestManager<int>();
  Future<int> presentNum({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _presentNumManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPresentNumCache() => _presentNumManager.clear();
  void clearPresentNumCacheKey(String? uniqueKey) =>
      _presentNumManager.clearRequest(uniqueKey);

  final _absentNumManager = FutureRequestManager<int>();
  Future<int> absentNum({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _absentNumManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAbsentNumCache() => _absentNumManager.clear();
  void clearAbsentNumCacheKey(String? uniqueKey) =>
      _absentNumManager.clearRequest(uniqueKey);

  final _excludedNumManager = FutureRequestManager<int>();
  Future<int> excludedNum({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _excludedNumManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearExcludedNumCache() => _excludedNumManager.clear();
  void clearExcludedNumCacheKey(String? uniqueKey) =>
      _excludedNumManager.clearRequest(uniqueKey);

  final _availabilityTeacherManager = FutureRequestManager<int>();
  Future<int> availabilityTeacher({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _availabilityTeacherManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAvailabilityTeacherCache() => _availabilityTeacherManager.clear();
  void clearAvailabilityTeacherCacheKey(String? uniqueKey) =>
      _availabilityTeacherManager.clearRequest(uniqueKey);

  final _studentdetails2Manager = StreamRequestManager<StudentRecord>();
  Stream<StudentRecord> studentdetails2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<StudentRecord> Function() requestFn,
  }) =>
      _studentdetails2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStudentdetails2Cache() => _studentdetails2Manager.clear();
  void clearStudentdetails2CacheKey(String? uniqueKey) =>
      _studentdetails2Manager.clearRequest(uniqueKey);

  final _userchatsManager = StreamRequestManager<UsersRecord>();
  Stream<UsersRecord> userchats({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<UsersRecord> Function() requestFn,
  }) =>
      _userchatsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserchatsCache() => _userchatsManager.clear();
  void clearUserchatsCacheKey(String? uniqueKey) =>
      _userchatsManager.clearRequest(uniqueKey);

  final _studentChildManager = StreamRequestManager<List<StudentRecord>>();
  Stream<List<StudentRecord>> studentChild({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<StudentRecord>> Function() requestFn,
  }) =>
      _studentChildManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStudentChildCache() => _studentChildManager.clear();
  void clearStudentChildCacheKey(String? uniqueKey) =>
      _studentChildManager.clearRequest(uniqueKey);

  final _cidadeManager = StreamRequestManager<List<CidadeRecord>>();
  Stream<List<CidadeRecord>> cidade({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CidadeRecord>> Function() requestFn,
  }) =>
      _cidadeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCidadeCache() => _cidadeManager.clear();
  void clearCidadeCacheKey(String? uniqueKey) =>
      _cidadeManager.clearRequest(uniqueKey);

  final _chatMessagingManager =
      StreamRequestManager<List<ChatMessagesRecord>>();
  Stream<List<ChatMessagesRecord>> chatMessaging({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatMessagesRecord>> Function() requestFn,
  }) =>
      _chatMessagingManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatMessagingCache() => _chatMessagingManager.clear();
  void clearChatMessagingCacheKey(String? uniqueKey) =>
      _chatMessagingManager.clearRequest(uniqueKey);

  final _chatListManager = StreamRequestManager<List<ChatsRecord>>();
  Stream<List<ChatsRecord>> chatList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatsRecord>> Function() requestFn,
  }) =>
      _chatListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatListCache() => _chatListManager.clear();
  void clearChatListCacheKey(String? uniqueKey) =>
      _chatListManager.clearRequest(uniqueKey);

  final _requesterListManager =
      StreamRequestManager<List<ClassesRequesterRecord>>();
  Stream<List<ClassesRequesterRecord>> requesterList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ClassesRequesterRecord>> Function() requestFn,
  }) =>
      _requesterListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRequesterListCache() => _requesterListManager.clear();
  void clearRequesterListCacheKey(String? uniqueKey) =>
      _requesterListManager.clearRequest(uniqueKey);

  final _bookingtestManager = StreamRequestManager<List<BookingsRecord>>();
  Stream<List<BookingsRecord>> bookingtest({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BookingsRecord>> Function() requestFn,
  }) =>
      _bookingtestManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBookingtestCache() => _bookingtestManager.clear();
  void clearBookingtestCacheKey(String? uniqueKey) =>
      _bookingtestManager.clearRequest(uniqueKey);

  final _solicitacaoPaisManager = FutureRequestManager<int>();
  Future<int> solicitacaoPais({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _solicitacaoPaisManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSolicitacaoPaisCache() => _solicitacaoPaisManager.clear();
  void clearSolicitacaoPaisCacheKey(String? uniqueKey) =>
      _solicitacaoPaisManager.clearRequest(uniqueKey);

  final _requestAvailabilityCasheManager =
      StreamRequestManager<List<RequestAvailabilityRecord>>();
  Stream<List<RequestAvailabilityRecord>> requestAvailabilityCashe({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RequestAvailabilityRecord>> Function() requestFn,
  }) =>
      _requestAvailabilityCasheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRequestAvailabilityCasheCache() =>
      _requestAvailabilityCasheManager.clear();
  void clearRequestAvailabilityCasheCacheKey(String? uniqueKey) =>
      _requestAvailabilityCasheManager.clearRequest(uniqueKey);

  final _studentdetailsManager = FutureRequestManager<StudentRecord>();
  Future<StudentRecord> studentdetails({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<StudentRecord> Function() requestFn,
  }) =>
      _studentdetailsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStudentdetailsCache() => _studentdetailsManager.clear();
  void clearStudentdetailsCacheKey(String? uniqueKey) =>
      _studentdetailsManager.clearRequest(uniqueKey);

  final _studantManager = StreamRequestManager<StudentRecord>();
  Stream<StudentRecord> studant({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<StudentRecord> Function() requestFn,
  }) =>
      _studantManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStudantCache() => _studantManager.clear();
  void clearStudantCacheKey(String? uniqueKey) =>
      _studantManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
