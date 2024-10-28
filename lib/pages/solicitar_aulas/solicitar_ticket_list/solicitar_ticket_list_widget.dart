import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/solicitar_aulas_components/empty_state/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'solicitar_ticket_list_model.dart';
export 'solicitar_ticket_list_model.dart';

class SolicitarTicketListWidget extends StatefulWidget {
  const SolicitarTicketListWidget({super.key});

  @override
  State<SolicitarTicketListWidget> createState() =>
      _SolicitarTicketListWidgetState();
}

class _SolicitarTicketListWidgetState extends State<SolicitarTicketListWidget> {
  late SolicitarTicketListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolicitarTicketListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 32.0,
            ),
          ),
          title: Text(
            'inbox',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Plus Jakarta Sans',
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    StreamBuilder<List<SupportTicketsRecord>>(
                      stream: querySupportTicketsRecord(
                        queryBuilder: (supportTicketsRecord) =>
                            supportTicketsRecord.orderBy('createdTime',
                                descending: true),
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
                        List<SupportTicketsRecord>
                            listViewSupportTicketsRecordList = snapshot.data!;
                        if (listViewSupportTicketsRecordList.isEmpty) {
                          return Center(
                            child: SizedBox(
                              height: 330.0,
                              child: EmptyStateWidget(
                                icon: Icon(
                                  Icons.mail_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 90.0,
                                ),
                                title: 'Você não tem uma solicitação',
                                body:
                                    'Crie uma solicitação para ter uma Aula Bilin pro seu filho.',
                                buttonAction: () async {
                                  context.pushNamed('Solicitar_SubmitTicket');
                                },
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewSupportTicketsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewSupportTicketsRecord =
                                listViewSupportTicketsRecordList[listViewIndex];
                            return StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  listViewSupportTicketsRecord.owner!),
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

                                final columnUsersRecord = snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((columnUsersRecord.displayName ==
                                            currentUserDisplayName) ||
                                        (currentUserDocument?.role ==
                                            Role.SuperAdmin))
                                      AuthUserStreamWidget(
                                        builder: (context) => Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((currentUserDocument
                                                              ?.role ==
                                                          Role.SuperAdmin) ||
                                                      (currentUserDocument
                                                              ?.role ==
                                                          Role.Admin)) {
                                                    context.pushNamed(
                                                      'Solicitar_TicketDetails',
                                                      queryParameters: {
                                                        'ticketRef':
                                                            serializeParam(
                                                          listViewSupportTicketsRecord,
                                                          ParamType.Document,
                                                        ),
                                                        'priorityDetails':
                                                            serializeParam(
                                                          listViewSupportTicketsRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'ticketRef':
                                                            listViewSupportTicketsRecord,
                                                        'priorityDetails':
                                                            listViewSupportTicketsRecord,
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    16.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        columnUsersRecord
                                                                            .displayName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        ' - ( ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child: StreamBuilder<
                                                                          AlunoRecord>(
                                                                        stream:
                                                                            AlunoRecord.getDocument(listViewSupportTicketsRecord.assignee2!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          final textAlunoRecord =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            textAlunoRecord.alunoNome,
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        ' )',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      listViewSupportTicketsRecord
                                                                          .description
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            140,
                                                                      ),
                                                                      maxLines:
                                                                          3,
                                                                      minFontSize:
                                                                          12.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Enviado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    if ((currentUserDocument?.role == Role.Pais) ||
                        (currentUserDocument?.role == Role.Teacher))
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 24.0, 24.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowIconButton(
                              borderRadius: 50.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Solicitar_SubmitTicket');
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
