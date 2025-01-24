import '/aa_nav_pages/comp/disponibilidades_b_t_n/disponibilidades_b_t_n_widget.dart';
import '/aa_nav_pages/comp/itineario1/itineario1_widget.dart';
import '/aa_nav_pages/comp/popup_user/popup_user_widget.dart';
import '/aa_nav_pages/comp/snack_bar/snack_bar_widget.dart';
import '/aa_nav_pages/comp/solicitacao_pais_b_t_n/solicitacao_pais_b_t_n_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/perfil_login_criar/comp/email_validation/email_validation_widget.dart';
import '/solicitacoes_pais/comp/agendarmento_pais/agendarmento_pais_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main_dashboard_model.dart';
export 'main_dashboard_model.dart';

class MainDashboardWidget extends StatefulWidget {
  const MainDashboardWidget({super.key});

  @override
  State<MainDashboardWidget> createState() => _MainDashboardWidgetState();
}

class _MainDashboardWidgetState extends State<MainDashboardWidget>
    with TickerProviderStateMixin {
  late MainDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainDashboardModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
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
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'auth_Perfil',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 1000),
                        ),
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: SizedBox(
                          height: 55.0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Hero(
                                          tag: valueOrDefault<String>(
                                            currentUserPhoto,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                          ),
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                currentUserPhoto,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                              ),
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'xb3pxgi7' /* Bem vindo */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 4.0, 0.0),
                    child: FutureBuilder<List<ChatsRecord>>(
                      future: queryChatsRecordOnce(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .where(
                              'users',
                              arrayContains: currentUserReference,
                            )
                            .orderBy('last_message_sent_by', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: SizedBox(
                                width: 15.0,
                                height: 15.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ChatsRecord> badgeChatsRecordList = snapshot.data!;

                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if ((currentUserDocument?.role == Role.Admin) ||
                                (currentUserDocument?.role ==
                                    Role.SuperAdmin)) {
                              context.pushNamed('chat_mainAdmin');
                            } else {
                              if ((currentUserDocument?.role == Role.Teacher) ||
                                  (currentUserDocument?.role == Role.Parent)) {
                                context.pushNamed('chat_main');
                              }
                            }
                          },
                          child: badges.Badge(
                            badgeContent: Text(
                              badgeChatsRecordList
                                  .where((e) => !e.lastMessageSeenBy
                                      .contains(currentUserReference))
                                  .toList()
                                  .length
                                  .toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            showBadge: badgeChatsRecordList
                                    .where((e) => !e.lastMessageSeenBy
                                        .contains(currentUserReference))
                                    .toList().isNotEmpty,
                            shape: badges.BadgeShape.circle,
                            badgeColor: FlutterFlowTheme.of(context).secondary,
                            elevation: 2.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            position: badges.BadgePosition.topEnd(),
                            animationType: badges.BadgeAnimationType.scale,
                            toAnimate: false,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.chat_bubble_outline_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
          elevation: 0.0,
        ),
      ),
      body: Stack(
        children: [
          StreamBuilder<List<BookingsRecord>>(
            stream: FFAppState().bookingtest(
              requestFn: () => queryBookingsRecord(),
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
              List<BookingsRecord> containerBookingsRecordList = snapshot.data!;

              return Container(
                decoration: const BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    if ((currentUserDocument?.role == Role.Admin) ||
                        (currentUserDocument?.role == Role.SuperAdmin)) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: FutureBuilder<int>(
                                future: FFAppState().availabilityTeacher(
                                  requestFn: () =>
                                      queryRequestAvailabilityRecordCount(
                                    queryBuilder: (requestAvailabilityRecord) =>
                                        requestAvailabilityRecord.where(
                                      'requestStatus',
                                      isEqualTo: Status.EmAnalise.serialize(),
                                    ),
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0x6C57636C),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  int disponibilidadesBTNCount = snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'AvailabilityListRequest',
                                        queryParameters: {
                                          'num': serializeParam(
                                            disponibilidadesBTNCount,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 750),
                                          ),
                                        },
                                      );
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
                                            num: disponibilidadesBTNCount,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: FutureBuilder<int>(
                                future: FFAppState().solicitacaoPais(
                                  requestFn: () =>
                                      queryClassesRequesterRecordCount(
                                    queryBuilder: (classesRequesterRecord) =>
                                        classesRequesterRecord.where(
                                      'isArchived',
                                      isEqualTo: false,
                                    ),
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0x6C57636C),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  int solicitacaoPaisBTNCount = snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SolicitarBookingAdmin',
                                        queryParameters: {
                                          'bookingDocList': serializeParam(
                                            containerBookingsRecordList,
                                            ParamType.Document,
                                            isList: true,
                                          ),
                                          'num': serializeParam(
                                            solicitacaoPaisBTNCount,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'bookingDocList':
                                              containerBookingsRecordList,
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 750),
                                          ),
                                        },
                                      );
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
                                            bookingListDoc:
                                                containerBookingsRecordList,
                                            num: solicitacaoPaisBTNCount,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: StreamBuilder<List<ChatsRecord>>(
                                    stream: queryChatsRecord(
                                      singleRecord: true,
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
                                      List<ChatsRecord>
                                          containerChatsRecordList =
                                          snapshot.data!;
                                      final containerChatsRecord =
                                          containerChatsRecordList.isNotEmpty
                                              ? containerChatsRecordList.first
                                              : null;

                                      return Container(
                                        width: double.infinity,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: FutureBuilder<List<UsersRecord>>(
                                          future: FFAppState().adminUsers(
                                            requestFn: () =>
                                                queryUsersRecordOnce(),
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
                                            List<UsersRecord>
                                                tabBarUsersRecordList =
                                                snapshot.data!;

                                            return Column(
                                              children: [
                                                Align(
                                                  alignment: const Alignment(0.0, 0),
                                                  child:
                                                      FlutterFlowButtonTabBar(
                                                    useToggleButtonStyle: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    unselectedLabelStyle:
                                                        const TextStyle(),
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    unselectedBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    unselectedBorderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    elevation: 0.0,
                                                    buttonMargin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    padding:
                                                        const EdgeInsets.all(4.0),
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'v6vteefg' /* Pais */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'kyy5f1vj' /* Teachers */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'q9wmhj5s' /* Admins */,
                                                        ),
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    children: [
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            final tabBarVarPais = tabBarUsersRecordList
                                                                .where((e) =>
                                                                    e.role ==
                                                                    Role.Parent)
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.displayName,
                                                                    desc: false)
                                                                .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  tabBarVarPais
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  tabBarVarPaisIndex) {
                                                                final tabBarVarPaisItem =
                                                                    tabBarVarPais[
                                                                        tabBarVarPaisIndex];
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 65.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
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
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                PopupUserWidget(
                                                                              userRole: tabBarVarPaisItem.role!.name,
                                                                              userName: tabBarVarPaisItem.displayName,
                                                                              userEmail: tabBarVarPaisItem.email,
                                                                              userImage: tabBarVarPaisItem.photoUrl,
                                                                              userID: tabBarVarPaisItem.reference,
                                                                              userDescription: tabBarVarPaisItem.shortDescription,
                                                                              chatRef: containerChatsRecord!,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                55.0,
                                                                            height:
                                                                                55.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              tabBarVarPaisItem.photoUrl,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            tabBarVarPaisItem.displayName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
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
                                                                            tabBarVarPaisItem.displayLastName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            final tabBarVarTeacher = tabBarUsersRecordList
                                                                .where((e) =>
                                                                    e.role ==
                                                                    Role
                                                                        .Teacher)
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.displayName,
                                                                    desc: false)
                                                                .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  tabBarVarTeacher
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  tabBarVarTeacherIndex) {
                                                                final tabBarVarTeacherItem =
                                                                    tabBarVarTeacher[
                                                                        tabBarVarTeacherIndex];
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 65.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x0F000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
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
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                PopupUserWidget(
                                                                              userRole: tabBarVarTeacherItem.role!.name,
                                                                              userName: tabBarVarTeacherItem.displayName,
                                                                              userEmail: tabBarVarTeacherItem.email,
                                                                              userImage: tabBarVarTeacherItem.photoUrl,
                                                                              userID: tabBarVarTeacherItem.reference,
                                                                              userDescription: tabBarVarTeacherItem.shortDescription,
                                                                              chatRef: containerChatsRecord!,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                55.0,
                                                                            height:
                                                                                55.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              tabBarVarTeacherItem.photoUrl,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            tabBarVarTeacherItem.displayName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
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
                                                                            tabBarVarTeacherItem.displayLastName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            final tabBarVarAdmin =
                                                                tabBarUsersRecordList
                                                                    .where((e) =>
                                                                        e.role ==
                                                                        Role
                                                                            .Admin)
                                                                    .toList()
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .displayName,
                                                                        desc:
                                                                            false)
                                                                    .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  tabBarVarAdmin
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  tabBarVarAdminIndex) {
                                                                final tabBarVarAdminItem =
                                                                    tabBarVarAdmin[
                                                                        tabBarVarAdminIndex];
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 65.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x0F000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
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
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                PopupUserWidget(
                                                                              userRole: tabBarVarAdminItem.role!.name,
                                                                              userName: tabBarVarAdminItem.displayName,
                                                                              userEmail: tabBarVarAdminItem.email,
                                                                              userImage: tabBarVarAdminItem.photoUrl,
                                                                              userID: tabBarVarAdminItem.reference,
                                                                              userDescription: tabBarVarAdminItem.shortDescription,
                                                                              chatRef: containerChatsRecord!,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                55.0,
                                                                            height:
                                                                                55.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              tabBarVarAdminItem.photoUrl,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            tabBarVarAdminItem.displayName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
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
                                                                            tabBarVarAdminItem.displayLastName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
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
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation']!),
                          ],
                        ),
                      );
                    } else if (currentUserDocument?.role == Role.Teacher) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 8.0),
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'kqt9ts0j' /* SEG */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'q0xfjbbl' /* TER */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'lrj3vaxe' /* QUA */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'ea1cbd6n' /* QUI */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'xb1z44fp' /* SEX */,
                                    ))
                                  ],
                                  onChanged: (val) => safeSetState(
                                      () => _model.dayValue = val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    iconColor: const Color(0x00000000),
                                    iconSize: 20.0,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: const Color(0x00000000),
                                    iconSize: 18.0,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                    elevation: 0.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  chipSpacing: 8.0,
                                  rowSpacing: 8.0,
                                  multiselect: false,
                                  initialized: _model.dayValue != null,
                                  alignment: WrapAlignment.start,
                                  controller: _model.dayValueController ??=
                                      FormFieldController<List<String>>(
                                    [
                                      functions.dateTimeToSimplifyDayString(
                                          getCurrentTimestamp)!
                                    ],
                                  ),
                                  wrapped: false,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'RegistroAulas',
                                    queryParameters: {
                                      'bookingDocList': serializeParam(
                                        containerBookingsRecordList,
                                        ParamType.Document,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'bookingDocList':
                                          containerBookingsRecordList,
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 500),
                                      ),
                                    },
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Icon(
                                              Icons.checklist_rtl_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'j0hh0gc7' /* Registro de Aulas */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 12.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: Color(0x1B090F13),
                                          offset: Offset(
                                            0.0,
                                            -2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final seg = containerBookingsRecordList
                                            .where((e) =>
                                                (e.bookingDayOfWeek ==
                                                    'Segunda') &&
                                                (e.bookingTeacherRef ==
                                                    currentUserReference) &&
                                                (e.bookingActive == true))
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => e.bookingTime!,
                                                desc: false)
                                            .toList()
                                            .take(7)
                                            .toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(seg.length,
                                              (segIndex) {
                                            final segItem = seg[segIndex];
                                            return Container(
                                              decoration: const BoxDecoration(),
                                              child:
                                                  FutureBuilder<StudentRecord>(
                                                future: StudentRecord
                                                    .getDocumentOnce(segItem
                                                        .bookingStudentRef!),
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

                                                  final itineario1StudentRecord =
                                                      snapshot.data!;

                                                  return wrapWithModel(
                                                    model: _model
                                                        .itineario1Models
                                                        .getModel(
                                                      itineario1StudentRecord
                                                          .reference.id,
                                                      segIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: Itineario1Widget(
                                                      key: Key(
                                                        'Keyzh0_${itineario1StudentRecord.reference.id}',
                                                      ),
                                                      complete: false,
                                                      student:
                                                          '${itineario1StudentRecord.studentName} ${itineario1StudentRecord.studentLastName}',
                                                      time: '${dateTimeFormat(
                                                        "Hm",
                                                        segItem.bookingTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )} até ${functions.add1hToTime(segItem.bookingTime)}',
                                                      index: () {
                                                        if (segItem
                                                                .bookingTime ==
                                                            containerBookingsRecordList
                                                                .where((e) =>
                                                                    (e.bookingDayOfWeek ==
                                                                        'Segunda') &&
                                                                    (e.bookingTeacherRef ==
                                                                        currentUserReference))
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) => e
                                                                        .bookingTime!,
                                                                    desc: false)
                                                                .firstOrNull
                                                                ?.bookingTime) {
                                                          return 0;
                                                        } else if (segItem
                                                                .bookingTime ==
                                                            containerBookingsRecordList
                                                                .where((e) =>
                                                                    (e.bookingDayOfWeek ==
                                                                        'Segunda') &&
                                                                    (e.bookingTeacherRef ==
                                                                        currentUserReference))
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.bookingTime!,
                                                                    desc: false)
                                                                .lastOrNull
                                                                ?.bookingTime) {
                                                          return -1;
                                                        } else {
                                                          return 1;
                                                        }
                                                      }(),
                                                      image:
                                                          itineario1StudentRecord
                                                              .studentPhoto,
                                                      teacherLocal: segItem
                                                          .bookingTeacherLocal,
                                                      studentLocal: segItem
                                                          .bookingStudentLocal,
                                                      is1hPlus: functions.stringTimeToBool(functions.intervalsTimes(
                                                              containerBookingsRecordList
                                                                  .where((e) =>
                                                                      (e.bookingDayOfWeek ==
                                                                          'Segunda') &&
                                                                      (e.bookingTeacherRef ==
                                                                          currentUserReference))
                                                                  .toList()
                                                                  .sortedList(
                                                                      keyOf: (e) => e
                                                                          .bookingTime!,
                                                                      desc:
                                                                          false)
                                                                  .map((e) => e
                                                                      .bookingTime)
                                                                  .withoutNulls
                                                                  .toList(),
                                                              segItem
                                                                  .bookingTime)) ==
                                                          true,
                                                      isHome: functions.intervalsTimes(
                                                          containerBookingsRecordList
                                                              .where((e) =>
                                                                  (e.bookingDayOfWeek ==
                                                                      'Segunda') &&
                                                                  (e.bookingTeacherRef ==
                                                                      currentUserReference))
                                                              .toList()
                                                              .sortedList(
                                                                  keyOf: (e) => e
                                                                      .bookingTime!,
                                                                  desc: false)
                                                              .map((e) =>
                                                                  e.bookingTime)
                                                              .withoutNulls
                                                              .toList(),
                                                          segItem.bookingTime),
                                                      isFirst: segItem
                                                              .bookingTime ==
                                                          containerBookingsRecordList
                                                              .where((e) =>
                                                                  (e.bookingDayOfWeek ==
                                                                      'Segunda') &&
                                                                  (e.bookingTeacherRef ==
                                                                      currentUserReference))
                                                              .toList()
                                                              .sortedList(
                                                                  keyOf: (e) =>
                                                                      e.bookingTime!,
                                                                  desc: false)
                                                              .firstOrNull
                                                              ?.bookingTime,
                                                      studentDoc:
                                                          itineario1StudentRecord,
                                                      nextDay: segItem
                                                          .bookingDayOfWeek,
                                                      nextTime:
                                                          segItem.bookingTime,
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else if (currentUserDocument?.role == Role.Parent) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'xzsch430' /* Meus filhos: */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StreamBuilder<List<StudentRecord>>(
                                            stream: FFAppState().studentChild(
                                              requestFn: () =>
                                                  queryStudentRecord(
                                                queryBuilder:
                                                    (studentRecord) =>
                                                        studentRecord.where(
                                                  'studentParentRef',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                              ),
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
                                              List<StudentRecord>
                                                  rowStudentRecordList =
                                                  snapshot.data!;

                                              return Row(
                                                mainAxisSize:
                                                    MainAxisSize.max,
                                                children: List.generate(
                                                    rowStudentRecordList
                                                        .length, (rowIndex) {
                                                  final rowStudentRecord =
                                                      rowStudentRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'PerfilAlunoBilin',
                                                          queryParameters: {
                                                            'studentParaDocument':
                                                                serializeParam(
                                                              rowStudentRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'studentParaDocument':
                                                                rowStudentRecord,
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            imageUrl:
                                                                rowStudentRecord
                                                                    .studentPhoto,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              borderRadius: 100.0,
                                              borderWidth: 0.2,
                                              buttonSize: 60.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              icon: Icon(
                                                Icons.add,
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                    'PerfilAlunoBilinCriar');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'euvfun0b' /* Agenda: */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await authManager.refreshUser();
                                        if (currentUserEmailVerified) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userCompleted,
                                              false)) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      const AgendarmentoPaisWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SnackBarWidget(
                                                    titulo:
                                                        'Complete seu cadastro',
                                                    mensagem:
                                                        'Para solicitar aulas, precisamos de mais algumas informações antes de proceguirmos, Aperte Continuar.',
                                                    buttonText: 'Continuar',
                                                    button: () async {
                                                      context.pushNamed(
                                                        'auth_EditPerfil',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    750),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child:
                                                      const EmailValidationWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 40.0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gjzou5no' /* Solicitar Aulas */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'c4t4toxe' /* Clique aqui para solicitar aul... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if ((containerBookingsRecordList
                                          .where((e) =>
                                              e.bookingParentRef ==
                                              currentUserReference)
                                          .toList()
                                          .isNotEmpty) ==
                                      false)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6vfe3001' /* Proxima aula: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final horarios =
                                              containerBookingsRecordList
                                                  .where((e) =>
                                                      (e.bookingParentRef ==
                                                          currentUserReference) &&
                                                      (e.bookingActive == true))
                                                  .toList()
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.bookingTime!,
                                                      desc: false)
                                                  .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: horarios.length,
                                            itemBuilder:
                                                (context, horariosIndex) {
                                              final horariosItem =
                                                  horarios[horariosIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 0.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.simplifyDayString(
                                                                    horariosItem
                                                                        .bookingDayOfWeek),
                                                                'SEG',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                "Hm",
                                                                horariosItem
                                                                    .bookingTime!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: StreamBuilder<
                                                            StudentRecord>(
                                                          stream: FFAppState()
                                                              .studant(
                                                            uniqueQueryKey:
                                                                horariosItem
                                                                    .reference
                                                                    .id,
                                                            requestFn: () =>
                                                                StudentRecord
                                                                    .getDocument(
                                                                        horariosItem
                                                                            .bookingStudentRef!),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                child: SizedBox(
                                                                  width: 25.0,
                                                                  height: 25.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0x6C57636C),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final containerStudentRecord =
                                                                snapshot.data!;

                                                            return Container(
                                                              height: 80.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        4.0,
                                                                        12.0,
                                                                        4.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        containerStudentRecord
                                                                            .studentPhoto,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            '${containerStudentRecord.studentName} ${containerStudentRecord.studentLastName}',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ky41jzzx' /* Adcione um aluno bilin */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ].addToEnd(const SizedBox(height: 63.0)),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '984fxc7i' /* Entre em contato com um Admini... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
