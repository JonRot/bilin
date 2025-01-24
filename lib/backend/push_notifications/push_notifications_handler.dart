import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? const Center(
          child: SizedBox(
            width: 25.0,
            height: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0x6C57636C),
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'auth_Create': ParameterData.none(),
  'auth_Login': ParameterData.none(),
  'auth_ForgotPassword': ParameterData.none(),
  'auth_Perfil': ParameterData.none(),
  'auth_EditPerfil': ParameterData.none(),
  'auth_Welcome': ParameterData.none(),
  'MainDashboard': ParameterData.none(),
  'chat_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_main': ParameterData.none(),
  'chat_InviteUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'PerfilAlunoBilinCriar': ParameterData.none(),
  'SolicitarBookingAdmin': (data) async => ParameterData(
        allParams: {
          'num': getParameter<int>(data, 'num'),
        },
      ),
  'chat_mainAdmin': ParameterData.none(),
  'LocalizacaoLista': ParameterData.none(),
  'AvailabilityListRequest': (data) async => ParameterData(
        allParams: {
          'num': getParameter<int>(data, 'num'),
        },
      ),
  'AvailableEditCopy': ParameterData.none(),
  'AvailableEdit': ParameterData.none(),
  'AvailableEditAdmin': (data) async => ParameterData(
        allParams: {
          'availabilityDoc':
              await getDocumentParameter<RequestAvailabilityRecord>(data,
                  'availabilityDoc', RequestAvailabilityRecord.fromSnapshot),
        },
      ),
  'AvailableEditCopy2': ParameterData.none(),
  'PerfilAlunoBilin': (data) async => ParameterData(
        allParams: {
          'studentParaDocument': await getDocumentParameter<StudentRecord>(
              data, 'studentParaDocument', StudentRecord.fromSnapshot),
          'bookingDoc': await getDocumentParameter<BookingsRecord>(
              data, 'bookingDoc', BookingsRecord.fromSnapshot),
        },
      ),
  'RegistroAulas': (data) async => const ParameterData(
        allParams: {},
      ),
  'RegistroAulasDetails': (data) async => ParameterData(
        allParams: {
          'bookingDoc': await getDocumentParameter<BookingsRecord>(
              data, 'bookingDoc', BookingsRecord.fromSnapshot),
          'studentDoc': await getDocumentParameter<StudentRecord>(
              data, 'studentDoc', StudentRecord.fromSnapshot),
          'presentNum': getParameter<int>(data, 'presentNum'),
          'absentNum': getParameter<int>(data, 'absentNum'),
          'exclusionNum': getParameter<int>(data, 'exclusionNum'),
        },
      ),
  'PerfilAlunoBilinEdit': (data) async => ParameterData(
        allParams: {
          'studentDocRef': await getDocumentParameter<StudentRecord>(
              data, 'studentDocRef', StudentRecord.fromSnapshot),
        },
      ),
  'notificationPermision': ParameterData.none(),
  'notificationList': ParameterData.none(),
  'NotificationForm': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
