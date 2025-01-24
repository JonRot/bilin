import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/solicitacoes_pais/comp/agendamento_booking_admin/agendamento_booking_admin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'request_parents_model.dart';
export 'request_parents_model.dart';

class RequestParentsWidget extends StatefulWidget {
  const RequestParentsWidget({
    super.key,
    this.hight,
    required this.bookingDocList,
  });

  final int? hight;
  final List<BookingsRecord>? bookingDocList;

  @override
  State<RequestParentsWidget> createState() => _RequestParentsWidgetState();
}

class _RequestParentsWidgetState extends State<RequestParentsWidget>
    with TickerProviderStateMixin {
  late RequestParentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestParentsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: StreamBuilder<List<ClassesRequesterRecord>>(
        stream: FFAppState().requesterList(
          requestFn: () => queryClassesRequesterRecord(
            queryBuilder: (classesRequesterRecord) =>
                classesRequesterRecord.orderBy('createdTime', descending: true),
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0x6C57636C),
                  ),
                ),
              ),
            );
          }
          List<ClassesRequesterRecord> tabBarClassesRequesterRecordList =
              snapshot.data!;

          return Column(
            children: [
              Align(
                alignment: const Alignment(0.0, 0),
                child: FlutterFlowButtonTabBar(
                  useToggleButtonStyle: true,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                  unselectedLabelStyle:
                      FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                  labelColor: FlutterFlowTheme.of(context).info,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                  unselectedBackgroundColor:
                      FlutterFlowTheme.of(context).alternate,
                  unselectedBorderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 0.0,
                  elevation: 0.0,
                  buttonMargin:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  tabs: [
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'yhiikv8x' /* Novas Solicitações */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'ejypfr8l' /* Arquivados */,
                      ),
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Builder(
                      builder: (context) {
                        final requesterListNew =
                            tabBarClassesRequesterRecordList
                                .where((e) => e.isArchived == false)
                                .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: requesterListNew.length,
                          itemBuilder: (context, requesterListNewIndex) {
                            final requesterListNewItem =
                                requesterListNew[requesterListNewIndex];
                            return FutureBuilder<UsersRecord>(
                              future: UsersRecord.getDocumentOnce(
                                  requesterListNewItem.requesterParent!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0x6C57636C),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final containerUsersRecord = snapshot.data!;

                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<StudentRecord>(
                                    future: FFAppState().studentdetails(
                                      requestFn: () =>
                                          StudentRecord.getDocumentOnce(
                                              requesterListNewItem
                                                  .requesterStudent!),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: SizedBox(
                                            width: 25.0,
                                            height: 25.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0x6C57636C),
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final containerStudentRecord =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if ((containerUsersRecord
                                                            .displayName ==
                                                        currentUserDisplayName) ||
                                                    (currentUserDocument
                                                            ?.role ==
                                                        Role.SuperAdmin))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(52.0, 0.0,
                                                                0.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if ((currentUserDocument
                                                                      ?.role ==
                                                                  Role
                                                                      .SuperAdmin) ||
                                                              (currentUserDocument
                                                                      ?.role ==
                                                                  Role.Admin)) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      AgendamentoBookingAdminWidget(
                                                                    studentFromTicket:
                                                                        requesterListNewItem,
                                                                    parentFromTicket:
                                                                        containerUsersRecord,
                                                                    studentDocument:
                                                                        containerStudentRecord,
                                                                    bookings:
                                                                        widget
                                                                            .bookingDocList,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        },
                                                        child: Slidable(
                                                          endActionPane:
                                                              ActionPane(
                                                            motion:
                                                                const ScrollMotion(),
                                                            extentRatio: 0.25,
                                                            children: [
                                                              SlidableAction(
                                                                label: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'zd0171rj' /* Arquivar */,
                                                                ),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                icon: Icons
                                                                    .archive_outlined,
                                                                onPressed:
                                                                    (_) async {
                                                                  await requesterListNewItem
                                                                      .reference
                                                                      .update(
                                                                          createClassesRequesterRecordData(
                                                                    isArchived:
                                                                        true,
                                                                  ));
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: ListTile(
                                                              title: Text(
                                                                '${valueOrDefault<String>(
                                                                  containerStudentRecord
                                                                      .studentName,
                                                                  'name',
                                                                )} ${valueOrDefault<String>(
                                                                  containerStudentRecord
                                                                      .studentLastName,
                                                                  'Last name',
                                                                )} - ${containerUsersRecord.displayName} ${containerUsersRecord.displayLastName}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                dateTimeFormat(
                                                                  "yMMMd",
                                                                  requesterListNewItem
                                                                      .createdTime!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
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
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: false,
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 16.0, 0.0, 8.0),
                                                child: Hero(
                                                  tag: containerStudentRecord
                                                      .studentPhoto,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Image.network(
                                                      containerStudentRecord
                                                          .studentPhoto,
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        final requesterListOld =
                            tabBarClassesRequesterRecordList
                                .where((e) => e.isArchived == true)
                                .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: requesterListOld.length,
                          itemBuilder: (context, requesterListOldIndex) {
                            final requesterListOldItem =
                                requesterListOld[requesterListOldIndex];
                            return StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  requesterListOldItem.requesterParent!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0x6C57636C),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final containerUsersRecord = snapshot.data!;

                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<StudentRecord>(
                                    stream: FFAppState().studentdetails2(
                                      requestFn: () =>
                                          StudentRecord.getDocument(
                                              requesterListOldItem
                                                  .requesterStudent!),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: SizedBox(
                                            width: 25.0,
                                            height: 25.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0x6C57636C),
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final containerStudentRecord =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      52.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if ((containerUsersRecord
                                                              .displayName ==
                                                          currentUserDisplayName) ||
                                                      (currentUserDocument
                                                              ?.role ==
                                                          Role.SuperAdmin))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if ((currentUserDocument
                                                                      ?.role ==
                                                                  Role
                                                                      .SuperAdmin) ||
                                                              (currentUserDocument
                                                                      ?.role ==
                                                                  Role.Admin)) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      AgendamentoBookingAdminWidget(
                                                                    studentFromTicket:
                                                                        requesterListOldItem,
                                                                    parentFromTicket:
                                                                        containerUsersRecord,
                                                                    studentDocument:
                                                                        containerStudentRecord,
                                                                    bookings:
                                                                        widget
                                                                            .bookingDocList,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        },
                                                        child: Slidable(
                                                          endActionPane:
                                                              ActionPane(
                                                            motion:
                                                                const ScrollMotion(),
                                                            extentRatio: 0.25,
                                                            children: [
                                                              SlidableAction(
                                                                label: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'hr710j6p' /* Deletar */,
                                                                ),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                icon: Icons
                                                                    .delete_outline_rounded,
                                                                onPressed:
                                                                    (_) async {
                                                                  await requesterListOldItem
                                                                      .reference
                                                                      .delete();
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: ListTile(
                                                              title: Text(
                                                                '${valueOrDefault<String>(
                                                                  containerStudentRecord
                                                                      .studentName,
                                                                  'name',
                                                                )} ${valueOrDefault<String>(
                                                                  containerStudentRecord
                                                                      .studentLastName,
                                                                  'Last name',
                                                                )} - ${containerUsersRecord.displayName} ${containerUsersRecord.displayLastName}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                dateTimeFormat(
                                                                  "yMMMd",
                                                                  requesterListOldItem
                                                                      .createdTime!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
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
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: false,
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 16.0, 0.0, 8.0),
                                                child: Hero(
                                                  tag: containerStudentRecord
                                                      .studentPhoto,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Image.network(
                                                      containerStudentRecord
                                                          .studentPhoto,
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
