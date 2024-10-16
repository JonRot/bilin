import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
            width: 30.0,
            height: 30.0,
            child: SpinKitPulse(
              color: Color(0x6C57636C),
              size: 30.0,
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
  'auth_CreatePerfil': ParameterData.none(),
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
  'AgendamentoDetalhes': (data) async => ParameterData(
        allParams: {
          'appointmentDetails':
              getParameter<DocumentReference>(data, 'appointmentDetails'),
          'teacherDetails':
              getParameter<DocumentReference>(data, 'teacherDetails'),
        },
      ),
  'AgendamentoDetalhesPerfil': (data) async => ParameterData(
        allParams: {
          'appointmentDetails':
              getParameter<DocumentReference>(data, 'appointmentDetails'),
        },
      ),
  'PerfilAlunoBilinCriar': ParameterData.none(),
  'CancelamentoAulas': ParameterData.none(),
  'CalendarioOld': ParameterData.none(),
  'MinhaAgendaPais': ParameterData.none(),
  'PerfilAlunoBilin': (data) async => ParameterData(
        allParams: {
          'userProfile': await getDocumentParameter<AlunoRecord>(
              data, 'userProfile', AlunoRecord.fromSnapshot),
        },
      ),
  'postFeed': ParameterData.none(),
  'WeekdaySelect': ParameterData.none(),
  'PerfilAlunoBilinEditar': (data) async => ParameterData(
        allParams: {
          'editarPerfilBilin': await getDocumentParameter<AlunoRecord>(
              data, 'editarPerfilBilin', AlunoRecord.fromSnapshot),
        },
      ),
  'Solicitar_TicketList': ParameterData.none(),
  'Solicitar_SubmitTicket': ParameterData.none(),
  'Solicitar_TicketDetails': (data) async => ParameterData(
        allParams: {
          'ticketRef': await getDocumentParameter<SupportTicketsRecord>(
              data, 'ticketRef', SupportTicketsRecord.fromSnapshot),
          'priorityDetails': await getDocumentParameter<SupportTicketsRecord>(
              data, 'priorityDetails', SupportTicketsRecord.fromSnapshot),
        },
      ),
  'MinhaAgendaTeacher': ParameterData.none(),
  'MinhaAgendaAdmin': ParameterData.none(),
  'Solicitar_TicketListAdmin': ParameterData.none(),
  'chat_mainAdmin': ParameterData.none(),
  'LocalizacaoLista': ParameterData.none(),
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
