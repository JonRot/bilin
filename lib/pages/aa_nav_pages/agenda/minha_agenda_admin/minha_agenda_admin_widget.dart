import '/backend/backend.dart';
import '/components/agendamento_componentes/solicitar_agendamento/solicitar_agendamento_widget.dart';
import '/components/dashboard/nav_bar/nav_bar_widget.dart';
import '/components/solicitar_aulas_components/appointment_card/appointment_card_widget.dart';
import '/components/solicitar_aulas_components/presenca_card/presenca_card_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'minha_agenda_admin_model.dart';
export 'minha_agenda_admin_model.dart';

class MinhaAgendaAdminWidget extends StatefulWidget {
  const MinhaAgendaAdminWidget({super.key});

  @override
  State<MinhaAgendaAdminWidget> createState() => _MinhaAgendaAdminWidgetState();
}

class _MinhaAgendaAdminWidgetState extends State<MinhaAgendaAdminWidget>
    with TickerProviderStateMixin {
  late MinhaAgendaAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinhaAgendaAdminModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Agenda',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Plus Jakarta Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Agenda do Aluno',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: false,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).alternate,
                        unselectedBorderColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        elevation: 0.0,
                        buttonMargin:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        tabs: const [
                          Tab(
                            text: 'Hoje',
                          ),
                          Tab(
                            text: 'Todas',
                          ),
                          Tab(
                            text: 'Presença',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: StreamBuilder<List<AppointmentsRecord>>(
                              stream: FFAppState().appointmentAgenda(
                                requestFn: () => queryAppointmentsRecord(
                                  queryBuilder: (appointmentsRecord) =>
                                      appointmentsRecord
                                          .orderBy('appointmentDate'),
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: SpinKitPulse(
                                        color: Color(0x6C57636C),
                                        size: 30.0,
                                      ),
                                    ),
                                  );
                                }
                                List<AppointmentsRecord>
                                    listViewAppointmentsRecordList =
                                    snapshot.data!;
                                if (listViewAppointmentsRecordList.isEmpty) {
                                  return const Center(
                                    child: SolicitarAgendamentoWidget(),
                                  );
                                }

                                return ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    65.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewAppointmentsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewAppointmentsRecord =
                                        listViewAppointmentsRecordList[
                                            listViewIndex];
                                    return AppointmentCardWidget(
                                      key: Key(
                                          'Key339_${listViewIndex}_of_${listViewAppointmentsRecordList.length}'),
                                      presencaText: valueOrDefault<String>(
                                        listViewAppointmentsRecord.presenca,
                                        'Teve Aula?',
                                      ),
                                      presensa:
                                          listViewAppointmentsRecord.presenca,
                                      imagemFundoAluno:
                                          listViewAppointmentsRecord.alunoFoto,
                                      parameter4: listViewAppointmentsRecord
                                          .nomeTeacher,
                                      docRefAppointments:
                                          listViewAppointmentsRecord.reference,
                                      dataHora: dateTimeFormat(
                                        "d MMM H:mm",
                                        listViewAppointmentsRecord
                                            .appointmentDate!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      linguagem: listViewAppointmentsRecord
                                          .appointmentLanguage,
                                      docRefUsers: listViewAppointmentsRecord
                                          .appointmentTeacher,
                                      local: valueOrDefault<String>(
                                        listViewAppointmentsRecord
                                            .appointmentLocation,
                                        'null',
                                      ),
                                      docRefAluno: listViewAppointmentsRecord
                                          .appointmentAlunoID,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child:
                                      StreamBuilder<List<AppointmentsRecord>>(
                                    stream: queryAppointmentsRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: SizedBox(
                                            width: 30.0,
                                            height: 30.0,
                                            child: SpinKitPulse(
                                              color: Color(0x6C57636C),
                                              size: 30.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<AppointmentsRecord>
                                          recurrenceCalendarAppointmentsRecordList =
                                          snapshot.data!;

                                      return SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child:
                                            custom_widgets.RecurrenceCalendar(
                                          width: double.infinity,
                                          height: double.infinity,
                                          isWebFullView: false,
                                          appointments:
                                              recurrenceCalendarAppointmentsRecordList,
                                          color: const Color(0xFFFF0000),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 60.0)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Aluno / Teacher',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Presença:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<List<AppointmentsRecord>>(
                                stream: queryAppointmentsRecord(
                                  queryBuilder: (appointmentsRecord) =>
                                      appointmentsRecord.orderBy('subject'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitPulse(
                                          color: Color(0x6C57636C),
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AppointmentsRecord>
                                      containerAppointmentsRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final unique =
                                            containerAppointmentsRecordList
                                                .unique(
                                                    (e) => e.uniqueCombinations)
                                                .toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(unique.length,
                                              (uniqueIndex) {
                                            final uniqueItem =
                                                unique[uniqueIndex];
                                            return PresencaCardWidget(
                                              key: Key(
                                                  'Keyz2j_${uniqueIndex}_of_${unique.length}'),
                                              foto: uniqueItem.alunoFoto,
                                              estudante: uniqueItem.subject,
                                              teacher: uniqueItem.nomeTeacher,
                                              presenca: uniqueItem.presenca,
                                              dateTime: dateTimeFormat(
                                                "d/M H:mm",
                                                uniqueItem.appointmentDate!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              teacherDoc: uniqueItem,
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: const BoxDecoration(),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const Hero(
                  tag: 'Nav',
                  transitionOnUserGestures: true,
                  child: Material(
                    color: Colors.transparent,
                    child: NavBarWidget(
                      navSelected: 2,
                      navHidden: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
