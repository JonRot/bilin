import '/aa_nav_pages/comp/solicitacao_pais_b_t_n/solicitacao_pais_b_t_n_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/solicitacoes_pais/comp/agendamento_booking_admin/agendamento_booking_admin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'solicitar_booking_admin_model.dart';
export 'solicitar_booking_admin_model.dart';

class SolicitarBookingAdminWidget extends StatefulWidget {
  const SolicitarBookingAdminWidget({
    super.key,
    required this.bookingDocList,
    required this.num,
  });

  final List<BookingsRecord>? bookingDocList;
  final int? num;

  @override
  State<SolicitarBookingAdminWidget> createState() =>
      _SolicitarBookingAdminWidgetState();
}

class _SolicitarBookingAdminWidgetState
    extends State<SolicitarBookingAdminWidget> with TickerProviderStateMixin {
  late SolicitarBookingAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolicitarBookingAdminModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            FFLocalizations.of(context).getText(
              '8b7lka47' /* Solicitações */,
            ),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                    HapticFeedback.selectionClick();
                  },
                  child: wrapWithModel(
                    model: _model.solicitacaoPaisBTNModel,
                    updateCallback: () => safeSetState(() {}),
                    child: Hero(
                      tag: 'solicitacaoPais',
                      transitionOnUserGestures: true,
                      child: Material(
                        color: Colors.transparent,
                        child: SolicitacaoPaisBTNWidget(
                          bookingListDoc: widget.bookingDocList,
                          num: widget.num!,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<ClassesRequesterRecord>>(
                  stream: queryClassesRequesterRecord(
                    queryBuilder: (classesRequesterRecord) =>
                        classesRequesterRecord.orderBy('createdTime',
                            descending: true),
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
                    List<ClassesRequesterRecord>
                        tabBarClassesRequesterRecordList = snapshot.data!;

                    return Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: false,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            labelColor: FlutterFlowTheme.of(context).info,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            unselectedBackgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            unselectedBorderColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 12.0,
                            elevation: 2.0,
                            buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 8.0, 12.0, 8.0),
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'xqzwmuwu' /* Solicitações */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'fc869ivj' /* Arquivados */,
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
                                    itemBuilder:
                                        (context, requesterListNewIndex) {
                                      final requesterListNewItem =
                                          requesterListNew[
                                              requesterListNewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: FutureBuilder<UsersRecord>(
                                          future: UsersRecord.getDocumentOnce(
                                              requesterListNewItem
                                                  .requesterParent!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return const Center(
                                                child: SizedBox(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0x6C57636C),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final containerUsersRecord =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child:
                                                  FutureBuilder<StudentRecord>(
                                                future:
                                                    FFAppState().studentdetails(
                                                  uniqueQueryKey:
                                                      requesterListNewItem
                                                          .reference.id,
                                                  requestFn: () => StudentRecord
                                                      .getDocumentOnce(
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
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
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
                                                          mainAxisSize:
                                                              MainAxisSize.min,
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
                                                                        .fromSTEB(
                                                                            52.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if ((currentUserDocument?.role ==
                                                                              Role
                                                                                  .SuperAdmin) ||
                                                                          (currentUserDocument?.role ==
                                                                              Role.Admin)) {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: AgendamentoBookingAdminWidget(
                                                                                  studentFromTicket: requesterListNewItem,
                                                                                  parentFromTicket: containerUsersRecord,
                                                                                  studentDocument: containerStudentRecord,
                                                                                  bookings: widget.bookingDocList,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      }
                                                                    },
                                                                    child:
                                                                        Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                FFLocalizations.of(context).getText(
                                                                              'aue2kd84' /* Arquivar */,
                                                                            ),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            icon:
                                                                                Icons.archive_outlined,
                                                                            onPressed:
                                                                                (_) async {
                                                                              await requesterListNewItem.reference.update(createClassesRequesterRecordData(
                                                                                isArchived: true,
                                                                              ));
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            ListTile(
                                                                          title:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              containerStudentRecord.studentName,
                                                                              'name',
                                                                            )} ${valueOrDefault<String>(
                                                                              containerStudentRecord.studentLastName,
                                                                              'Last name',
                                                                            )} - ${containerUsersRecord.displayName} ${containerUsersRecord.displayLastName}',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          subtitle:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              "yMMMd",
                                                                              requesterListNewItem.createdTime!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          dense:
                                                                              false,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
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
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Hero(
                                                              tag: containerStudentRecord
                                                                  .studentPhoto,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                                child: Image
                                                                    .network(
                                                                  containerStudentRecord
                                                                      .studentPhoto,
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                        ),
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
                                    itemBuilder:
                                        (context, requesterListOldIndex) {
                                      final requesterListOldItem =
                                          requesterListOld[
                                              requesterListOldIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              requesterListOldItem
                                                  .requesterParent!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return const Center(
                                                child: SizedBox(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0x6C57636C),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final containerUsersRecord =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child:
                                                  StreamBuilder<StudentRecord>(
                                                stream: FFAppState()
                                                    .studentdetails2(
                                                  uniqueQueryKey:
                                                      requesterListOldItem
                                                          .reference.id,
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
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
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
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      52.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              if ((containerUsersRecord
                                                                          .displayName ==
                                                                      currentUserDisplayName) ||
                                                                  (currentUserDocument
                                                                          ?.role ==
                                                                      Role.SuperAdmin))
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if ((currentUserDocument?.role ==
                                                                              Role
                                                                                  .SuperAdmin) ||
                                                                          (currentUserDocument?.role ==
                                                                              Role.Admin)) {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: AgendamentoBookingAdminWidget(
                                                                                  studentFromTicket: requesterListOldItem,
                                                                                  parentFromTicket: containerUsersRecord,
                                                                                  studentDocument: containerStudentRecord,
                                                                                  bookings: widget.bookingDocList,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      }
                                                                    },
                                                                    child:
                                                                        Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                FFLocalizations.of(context).getText(
                                                                              'f2p6r47i' /* Deletar */,
                                                                            ),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            icon:
                                                                                Icons.delete_outline_rounded,
                                                                            onPressed:
                                                                                (_) async {
                                                                              await requesterListOldItem.reference.delete();
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            ListTile(
                                                                          title:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              containerStudentRecord.studentName,
                                                                              'name',
                                                                            )} ${valueOrDefault<String>(
                                                                              containerStudentRecord.studentLastName,
                                                                              'Last name',
                                                                            )} - ${containerUsersRecord.displayName} ${containerUsersRecord.displayLastName}',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          subtitle:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              "yMMMd",
                                                                              requesterListOldItem.createdTime!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          dense:
                                                                              false,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
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
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Hero(
                                                              tag: containerStudentRecord
                                                                  .studentPhoto,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                                child: Image
                                                                    .network(
                                                                  containerStudentRecord
                                                                      .studentPhoto,
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                        ),
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
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
