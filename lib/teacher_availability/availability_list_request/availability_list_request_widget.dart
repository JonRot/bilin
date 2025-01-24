import '/aa_nav_pages/comp/disponibilidades_b_t_n/disponibilidades_b_t_n_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'availability_list_request_model.dart';
export 'availability_list_request_model.dart';

class AvailabilityListRequestWidget extends StatefulWidget {
  const AvailabilityListRequestWidget({
    super.key,
    required this.num,
  });

  final int? num;

  @override
  State<AvailabilityListRequestWidget> createState() =>
      _AvailabilityListRequestWidgetState();
}

class _AvailabilityListRequestWidgetState
    extends State<AvailabilityListRequestWidget> with TickerProviderStateMixin {
  late AvailabilityListRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailabilityListRequestModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'tabBarOnPageLoadAnimation': AnimationInfo(
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
              context.safePop();
              HapticFeedback.selectionClick();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 32.0,
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'd1mmcrrv' /* Teachers */,
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
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
                  model: _model.disponibilidadesBTNModel,
                  updateCallback: () => safeSetState(() {}),
                  child: Hero(
                    tag: 'disponibilidadeTeachers',
                    transitionOnUserGestures: true,
                    child: Material(
                      color: Colors.transparent,
                      child: DisponibilidadesBTNWidget(
                        num: widget.num!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<RequestAvailabilityRecord>>(
                stream: FFAppState().requestAvailabilityCashe(
                  requestFn: () => queryRequestAvailabilityRecord(),
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
                  List<RequestAvailabilityRecord>
                      containerRequestAvailabilityRecordList = snapshot.data!;

                  return Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: FlutterFlowButtonTabBar(
                              useToggleButtonStyle: false,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              labelColor: FlutterFlowTheme.of(context).info,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                              unselectedBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              borderWidth: 0.0,
                              borderRadius: 12.0,
                              elevation: 1.0,
                              labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'g2zhj2xf' /* Aprovado */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '5ddw3n11' /* Rejeitado / Analise */,
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
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final requestedAvailabilityOlder =
                                          containerRequestAvailabilityRecordList
                                              .map((e) => e)
                                              .toList()
                                              .where((e) =>
                                                  e.requestStatus ==
                                                  Status.Aprovado)
                                              .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            requestedAvailabilityOlder.length,
                                        itemBuilder: (context,
                                            requestedAvailabilityOlderIndex) {
                                          final requestedAvailabilityOlderItem =
                                              requestedAvailabilityOlder[
                                                  requestedAvailabilityOlderIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  requestedAvailabilityOlderItem
                                                      .requestTeacherDocRef!),
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

                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().availability =
                                                        requestedAvailabilityOlderItem
                                                            .requestAvailability
                                                            .toList()
                                                            .cast<
                                                                AvailabilityStruct>();
                                                    safeSetState(() {});

                                                    context.pushNamed(
                                                      'AvailableEditAdmin',
                                                      queryParameters: {
                                                        'availabilityDoc':
                                                            serializeParam(
                                                          requestedAvailabilityOlderItem,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'availabilityDoc':
                                                            requestedAvailabilityOlderItem,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              containerUsersRecord
                                                                  .photoUrl,
                                                              width: 44.0,
                                                              height: 44.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerUsersRecord
                                                                              .displayName,
                                                                          'Nome',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            containerUsersRecord.displayLastName,
                                                                            'Sobrenome',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerUsersRecord
                                                                            .email,
                                                                        'Email',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "MMMEd",
                                                                    requestedAvailabilityOlderItem
                                                                        .createdTime,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  'Mon, Dec 2',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: () {
                                                                      if (requestedAvailabilityOlderItem
                                                                              .requestStatus ==
                                                                          Status
                                                                              .Aprovado) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent2;
                                                                      } else if (requestedAvailabilityOlderItem
                                                                              .requestStatus ==
                                                                          Status
                                                                              .EmAnalise) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent1;
                                                                      } else if (requestedAvailabilityOlderItem
                                                                              .requestStatus ==
                                                                          Status
                                                                              .Rejeitado) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondaryText;
                                                                      }
                                                                    }(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          () {
                                                                        if (requestedAvailabilityOlderItem.requestStatus ==
                                                                            Status
                                                                                .Aprovado) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondary;
                                                                        } else if (requestedAvailabilityOlderItem.requestStatus ==
                                                                            Status
                                                                                .EmAnalise) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .primary;
                                                                        } else if (requestedAvailabilityOlderItem.requestStatus ==
                                                                            Status.Rejeitado) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .accent3;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .primaryText;
                                                                        }
                                                                      }(),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          requestedAvailabilityOlderItem
                                                                              .requestStatus
                                                                              ?.name,
                                                                          'null',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final reqAvailabilityAnalise =
                                          containerRequestAvailabilityRecordList
                                              .map((e) => e)
                                              .toList()
                                              .where((e) =>
                                                  e.requestStatus !=
                                                  Status.Aprovado)
                                              .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            reqAvailabilityAnalise.length,
                                        itemBuilder: (context,
                                            reqAvailabilityAnaliseIndex) {
                                          final reqAvailabilityAnaliseItem =
                                              reqAvailabilityAnalise[
                                                  reqAvailabilityAnaliseIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: FutureBuilder<UsersRecord>(
                                              future: UsersRecord.getDocumentOnce(
                                                  reqAvailabilityAnaliseItem
                                                      .requestTeacherDocRef!),
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

                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().availability =
                                                        reqAvailabilityAnaliseItem
                                                            .requestAvailability
                                                            .toList()
                                                            .cast<
                                                                AvailabilityStruct>();
                                                    safeSetState(() {});

                                                    context.pushNamed(
                                                      'AvailableEditAdmin',
                                                      queryParameters: {
                                                        'availabilityDoc':
                                                            serializeParam(
                                                          reqAvailabilityAnaliseItem,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'availabilityDoc':
                                                            reqAvailabilityAnaliseItem,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              containerUsersRecord
                                                                  .photoUrl,
                                                              width: 44.0,
                                                              height: 44.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerUsersRecord
                                                                              .displayName,
                                                                          'Nome',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            containerUsersRecord.displayLastName,
                                                                            'Sobrenome',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerUsersRecord
                                                                            .email,
                                                                        'Email',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "MMMEd",
                                                                    reqAvailabilityAnaliseItem
                                                                        .createdTime,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  'Mon, Dec 2',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: () {
                                                                      if (reqAvailabilityAnaliseItem
                                                                              .requestStatus ==
                                                                          Status
                                                                              .Aprovado) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent2;
                                                                      } else if (reqAvailabilityAnaliseItem
                                                                              .requestStatus ==
                                                                          Status
                                                                              .EmAnalise) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent1;
                                                                      } else if (reqAvailabilityAnaliseItem
                                                                              .requestStatus ==
                                                                          Status
                                                                              .Rejeitado) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondaryText;
                                                                      }
                                                                    }(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          () {
                                                                        if (reqAvailabilityAnaliseItem.requestStatus ==
                                                                            Status
                                                                                .Aprovado) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondary;
                                                                        } else if (reqAvailabilityAnaliseItem.requestStatus ==
                                                                            Status
                                                                                .EmAnalise) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .primary;
                                                                        } else if (reqAvailabilityAnaliseItem.requestStatus ==
                                                                            Status.Rejeitado) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .accent3;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .primaryText;
                                                                        }
                                                                      }(),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          reqAvailabilityAnaliseItem
                                                                              .requestStatus
                                                                              ?.name,
                                                                          'null',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['tabBarOnPageLoadAnimation']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
