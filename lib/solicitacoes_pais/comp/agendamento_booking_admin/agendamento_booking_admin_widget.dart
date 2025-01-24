import '/aa_nav_pages/comp/request_parents_title/request_parents_title_widget.dart';
import '/aa_nav_pages/comp/student_popup/student_popup_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/solicitacoes_pais/comp/user_list_teacher/user_list_teacher_widget.dart';
import '/solicitacoes_pais/comp/user_sub_teacher/user_sub_teacher_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'agendamento_booking_admin_model.dart';
export 'agendamento_booking_admin_model.dart';

class AgendamentoBookingAdminWidget extends StatefulWidget {
  const AgendamentoBookingAdminWidget({
    super.key,
    this.studentFromTicket,
    this.parentFromTicket,
    this.studentDocument,
    this.bookings,
  });

  final ClassesRequesterRecord? studentFromTicket;
  final UsersRecord? parentFromTicket;
  final StudentRecord? studentDocument;
  final List<BookingsRecord>? bookings;

  @override
  State<AgendamentoBookingAdminWidget> createState() =>
      _AgendamentoBookingAdminWidgetState();
}

class _AgendamentoBookingAdminWidgetState
    extends State<AgendamentoBookingAdminWidget> {
  late AgendamentoBookingAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendamentoBookingAdminModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150.0,
                child: Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: wrapWithModel(
                  model: _model.requestParentsTitleModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const RequestParentsTitleWidget(),
                ),
              ),
              if (_model.userRefSelected1?.reference == null)
                Hero(
                  tag: valueOrDefault<String>(
                    widget.studentDocument?.studentPhoto,
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                  ),
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.studentDocument?.studentPhoto,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                      ),
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (_model.userRefSelected1?.reference == null)
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.studentDocument?.studentName,
                                'Nome',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.studentDocument?.studentLastName,
                                  'LastName',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 50.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.info_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          child: StudentPopupWidget(
                                            studentDoc:
                                                widget.studentDocument!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              FutureBuilder<List<UsersRecord>>(
                future: queryUsersRecordOnce(
                  queryBuilder: (usersRecord) => usersRecord.where(
                    'role',
                    isEqualTo: Role.Teacher.serialize(),
                  ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 38.0, 0.0, 38.0),
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).tertiary,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> containerUsersRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerUsersRecord =
                      containerUsersRecordList.isNotEmpty
                          ? containerUsersRecordList.first
                          : null;

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: FutureBuilder<CidadeRecord>(
                        future: CidadeRecord.getDocumentOnce(
                            widget.studentFromTicket!.requesterLocation!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 38.0, 0.0, 38.0),
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).tertiary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }

                          final containerCidadeRecord = snapshot.data!;

                          return Container(
                            decoration: const BoxDecoration(),
                            child: FutureBuilder<List<ClassesRecord>>(
                              future: queryClassesRecordOnce(
                                queryBuilder: (classesRecord) =>
                                    classesRecord.where(
                                  'classTeacherDocRef',
                                  isEqualTo: _model.userRefSelected1?.reference,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 38.0, 0.0, 38.0),
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ClassesRecord> containerClassesRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerClassesRecord =
                                    containerClassesRecordList.isNotEmpty
                                        ? containerClassesRecordList.first
                                        : null;

                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: DistanceAPICall.call(
                                      local2: containerCidadeRecord
                                          .enderecoCompleto,
                                      mode: valueOrDefault<String>(
                                        FFAppState().APIMode,
                                        'driving',
                                      ),
                                      local1:
                                          FFAppState().apiLocation == ''
                                              ? containerCidadeRecord
                                                  .enderecoCompleto
                                              : FFAppState().apiLocation,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 38.0, 0.0, 38.0),
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final containerDistanceAPIResponse =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bkhhm5w4' /* Teacher: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
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
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                UserListTeacherWidget(
                                                              classes:
                                                                  containerClassesRecord!,
                                                              bookingDoc: widget
                                                                  .bookings!,
                                                              studentDoc: widget
                                                                  .studentDocument!,
                                                              cidadeDoc:
                                                                  containerCidadeRecord,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.userRefSelected1 =
                                                                  value));

                                                      FFAppState().apiLocation =
                                                          _model
                                                              .userRefSelected1!
                                                              .userDefaultLocation;
                                                      safeSetState(() {});
                                                      _model.chatRefComponentState =
                                                          await queryChatsRecordOnce();
                                                      if (_model
                                                          .chatRefComponentState!
                                                          .where((e) =>
                                                              (e.userA ==
                                                                  _model
                                                                      .userRefSelected1
                                                                      ?.reference) &&
                                                              (e.userB ==
                                                                  widget
                                                                      .studentDocument
                                                                      ?.studentParentRef))
                                                          .toList()
                                                          .isNotEmpty) {
                                                        // addChatUsers_ToList
                                                        _model.chatReference =
                                                            _model
                                                                .chatRefComponentState
                                                                ?.firstOrNull
                                                                ?.reference;
                                                        safeSetState(() {});
                                                      } else {
                                                        // addUser_ToList
                                                        _model.insertAtIndexInListChatRef(
                                                            0,
                                                            _model
                                                                .userRefSelected1!
                                                                .reference);
                                                        safeSetState(() {});
                                                        // addUser_ToList
                                                        _model.insertAtIndexInListChatRef(
                                                            1,
                                                            widget
                                                                .studentDocument!
                                                                .studentParentRef!);
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {
                                                        _model
                                                            .segTimesValueController
                                                            ?.reset();
                                                      });

                                                      safeSetState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 65.0,
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth: 500.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if ((containerUsersRecord
                                                                        ?.reference !=
                                                                    null) ||
                                                                (containerUsersRecord
                                                                        ?.role ==
                                                                    Role.Teacher))
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .userSubTeacherModel,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      UserSubTeacherWidget(
                                                                    userRefUsers:
                                                                        _model
                                                                            .userRefSelected1,
                                                                    action:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ),
                                                            if (containerUsersRecord
                                                                    ?.reference ==
                                                                null)
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'g4w3u972' /* Adicione uma Teacher */,
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
                                                              child: Icon(
                                                                Icons
                                                                    .mode_edit_outline,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.userRefSelected1
                                                        ?.reference ==
                                                    null)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '7ene1755' /* Escolha a Teacher */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.userRefSelected1
                                                        ?.reference !=
                                                    null)
                                                  ClipRRect(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'lv8hwkb0' /* Horários diaponiveis do estuda... */,
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
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Transform
                                                                            .translate(
                                                                          offset: const Offset(
                                                                              0.0,
                                                                              108.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 100.0, 0.0),
                                                                                child: Container(
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              _model.selectedTimetoTime,
                                                                                              '--:--',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            _model.segTimesValue,
                                                                                            '--:--',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
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
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: SvgPicture.asset(
                                                                                'assets/images/Screenshot_2025-01-15_at_11.svg',
                                                                                width: 200.0,
                                                                                height: 40.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Transform.translate(
                                                                              offset: const Offset(0.0, -20.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  if (FFAppState().APIMode == 'walking')
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        FFAppState().APIMode = 'driving';
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: valueOrDefault<String>(
                                                                                        DistanceAPICall.timeDistance(
                                                                                          containerDistanceAPIResponse.jsonBody,
                                                                                        ),
                                                                                        'walking',
                                                                                      ),
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.walking,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        size: 12.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                    ),
                                                                                  if (FFAppState().APIMode == 'driving')
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        FFAppState().APIMode = 'walking';
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: valueOrDefault<String>(
                                                                                        DistanceAPICall.timeDistance(
                                                                                          containerDistanceAPIResponse.jsonBody,
                                                                                        ),
                                                                                        'driving',
                                                                                      ),
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.car,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        size: 12.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 2.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                    ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'sa0cvg67' /* Distâcia: */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                                    DistanceAPICall.kmDistance(
                                                                                                      containerDistanceAPIResponse.jsonBody,
                                                                                                    ),
                                                                                                    'km',
                                                                                                  ) ==
                                                                                                  '1 m'
                                                                                              ? '1 metro'
                                                                                              : valueOrDefault<String>(
                                                                                                  DistanceAPICall.kmDistance(
                                                                                                    containerDistanceAPIResponse.jsonBody,
                                                                                                  ),
                                                                                                  'km',
                                                                                                ),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Transform
                                                                            .translate(
                                                                          offset: const Offset(
                                                                              0.0,
                                                                              -50.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 100.0, 0.0),
                                                                                      child: Material(
                                                                                        color: Colors.transparent,
                                                                                        elevation: 2.0,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                        child: Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FFAppState().apiLocation != (containerClassesRecord?.classAvailability.elementAtOrNull(0))?.local ? FlutterFlowTheme.of(context).accent3 : FlutterFlowTheme.of(context).tertiary,
                                                                                            borderRadius: BorderRadius.circular(100.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              if (_model.studentRef?.reference == null)
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                  child: Icon(
                                                                                                    Icons.home,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                ),
                                                                                              if (_model.studentRef?.reference != null)
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    FFAppState().apiLocation = containerUsersRecord!.userDefaultLocation;
                                                                                                    safeSetState(() {});
                                                                                                    _model.studentRef = null;
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 38.0,
                                                                                                    height: 38.0,
                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                    decoration: const BoxDecoration(
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    child: Image.network(
                                                                                                      valueOrDefault<String>(
                                                                                                        _model.studentRef?.studentPhoto,
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                                                                                      ),
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Container(
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: const BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.network(
                                                                                            valueOrDefault<String>(
                                                                                              widget.studentDocument?.studentPhoto,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                                                                            ),
                                                                                            fit: BoxFit.cover,
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (((widget.studentFromTicket?.requesterAvailability.where((e) => e.hasStartTime()).toList() !=
                                                                                null &&
                                                                            (widget.studentFromTicket?.requesterAvailability.where((e) => e.hasStartTime()).toList())!
                                                                                .isNotEmpty) !=
                                                                        null) &&
                                                                    (_model.userRefSelected1
                                                                            ?.reference !=
                                                                        null))
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              FlutterFlowChoiceChips(
                                                                            options: [
                                                                              ChipData(FFLocalizations.of(context).getText(
                                                                                'z966fk0n' /* SEG */,
                                                                              )),
                                                                              ChipData(FFLocalizations.of(context).getText(
                                                                                '22us4e5d' /* TER */,
                                                                              )),
                                                                              ChipData(FFLocalizations.of(context).getText(
                                                                                'gpzrxla4' /* QUA */,
                                                                              )),
                                                                              ChipData(FFLocalizations.of(context).getText(
                                                                                '8debvgxs' /* QUI */,
                                                                              )),
                                                                              ChipData(FFLocalizations.of(context).getText(
                                                                                'dmzh4ykt' /* SEX */,
                                                                              ))
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.dayValue = val?.firstOrNull);
                                                                              FFAppState().apiLocation = containerClassesRecord!.classAvailability.elementAtOrNull(functions.indexFromWeekDayString(_model.dayValue)!)!.hasLocal() ? containerClassesRecord.classAvailability.elementAtOrNull(functions.indexFromWeekDayString(_model.dayValue)!)!.local : _model.userRefSelected1!.userDefaultLocation;
                                                                              safeSetState(() {});
                                                                            },
                                                                            selectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                              iconColor: const Color(0x00000000),
                                                                              iconSize: 20.0,
                                                                              labelPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              elevation: 0.0,
                                                                              borderColor: FlutterFlowTheme.of(context).tertiary,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            unselectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              iconColor: const Color(0x00000000),
                                                                              iconSize: 18.0,
                                                                              labelPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              elevation: 0.0,
                                                                              borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            chipSpacing:
                                                                                8.0,
                                                                            rowSpacing:
                                                                                8.0,
                                                                            multiselect:
                                                                                false,
                                                                            initialized:
                                                                                _model.dayValue != null,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            controller: _model.dayValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                              [
                                                                                FFLocalizations.of(context).getText(
                                                                                  'cvq88kid' /* SEG */,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            wrapped:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .dayValue ==
                                                                          'SEG')
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'emfprprf' /* SEG - Horários já marcados: */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        if (functions.getAvailabilitySlotsBetweenAboveBool(widget.bookings?.where((e) => (e.bookingDayOfWeek == 'Segunda') && (((e.bookingStudentRef == widget.studentDocument?.reference) && (e.bookingTeacherRef != _model.userRefSelected1?.reference)) || (e.bookingTeacherRef == _model.userRefSelected1?.reference))).toList().map((e) => e.bookingTime).withoutNulls.toList().toList(), _model.segTimesValue) ?? true)
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                safeSetState(() {
                                                                                                  _model.segTimesValueController?.reset();
                                                                                                });
                                                                                              },
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                child: FaIcon(
                                                                                                                  FontAwesomeIcons.clock,
                                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                '${_model.segTimesValue} até ${functions.add1hToTime(functions.stringTimeToDateTime(_model.segTimesValue))}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Outfit',
                                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'acpjxw69' /* Selecionado */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Outfit',
                                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                        child: Icon(
                                                                                                          Icons.location_on_sharp,
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final segFeedback = widget.bookings?.where((e) => (e.bookingDayOfWeek == 'Segunda') && (((e.bookingStudentRef == widget.studentDocument?.reference) && (e.bookingTeacherRef != _model.userRefSelected1?.reference)) || (e.bookingTeacherRef == _model.userRefSelected1?.reference))).toList().sortedList(keyOf: (e) => e.bookingTime!, desc: false).toList() ?? [];

                                                                                              return ListView.builder(
                                                                                                padding: EdgeInsets.zero,
                                                                                                primary: false,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: segFeedback.length,
                                                                                                itemBuilder: (context, segFeedbackIndex) {
                                                                                                  final segFeedbackItem = segFeedback[segFeedbackIndex];
                                                                                                  return Container(
                                                                                                    decoration: const BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                          child: StreamBuilder<UsersRecord>(
                                                                                                            stream: UsersRecord.getDocument(segFeedbackItem.bookingTeacherRef!),
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

                                                                                                              final containerUsersRecord = snapshot.data!;

                                                                                                              return Container(
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: StreamBuilder<StudentRecord>(
                                                                                                                  stream: StudentRecord.getDocument(segFeedbackItem.bookingStudentRef!),
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

                                                                                                                    final containerStudentRecord = snapshot.data!;

                                                                                                                    return InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        if (_model.studentRef?.reference == containerStudentRecord.reference) {
                                                                                                                          FFAppState().apiLocation = containerUsersRecord.userDefaultLocation;
                                                                                                                          safeSetState(() {});
                                                                                                                          _model.studentRef = null;
                                                                                                                          _model.selectedTimetoTime = null;
                                                                                                                          safeSetState(() {});
                                                                                                                        } else {
                                                                                                                          FFAppState().apiLocation = segFeedbackItem.bookingStudentLocal;
                                                                                                                          safeSetState(() {});
                                                                                                                          _model.studentRef = containerStudentRecord;
                                                                                                                          _model.selectedTimetoTime = functions.add1hToTime(segFeedbackItem.bookingTime);
                                                                                                                          safeSetState(() {});
                                                                                                                        }
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: segFeedbackItem.bookingStudentRef == widget.studentDocument?.reference ? FlutterFlowTheme.of(context).primaryBackground : (containerStudentRecord.reference == _model.studentRef?.reference ? (Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).secondaryText : const Color(0xFFD1F3FF)) : FlutterFlowTheme.of(context).secondaryBackground),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: segFeedbackItem.bookingStudentRef == widget.studentDocument?.reference ? FlutterFlowTheme.of(context).tertiary : const Color(0x00000000),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                  children: [
                                                                                                                                    SizedBox(
                                                                                                                                      width: 40.0,
                                                                                                                                      child: Stack(
                                                                                                                                        children: [
                                                                                                                                          Container(
                                                                                                                                            width: 24.0,
                                                                                                                                            height: 24.0,
                                                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                                                            decoration: const BoxDecoration(
                                                                                                                                              shape: BoxShape.circle,
                                                                                                                                            ),
                                                                                                                                            child: Image.network(
                                                                                                                                              valueOrDefault<String>(
                                                                                                                                                containerUsersRecord.photoUrl,
                                                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                                                                                                                              ),
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          Padding(
                                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                                            child: Container(
                                                                                                                                              width: 24.0,
                                                                                                                                              height: 24.0,
                                                                                                                                              clipBehavior: Clip.antiAlias,
                                                                                                                                              decoration: const BoxDecoration(
                                                                                                                                                shape: BoxShape.circle,
                                                                                                                                              ),
                                                                                                                                              child: Image.network(
                                                                                                                                                valueOrDefault<String>(
                                                                                                                                                  containerStudentRecord.studentPhoto,
                                                                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                                                                                                                                ),
                                                                                                                                                fit: BoxFit.cover,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        '${dateTimeFormat(
                                                                                                                                          "Hm",
                                                                                                                                          segFeedbackItem.bookingTime,
                                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                                        )} até ${functions.add1hToTime(segFeedbackItem.bookingTime)}',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Outfit',
                                                                                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        valueOrDefault<String>(
                                                                                                                                          containerStudentRecord.studentName,
                                                                                                                                          'jon',
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Outfit',
                                                                                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        valueOrDefault<String>(
                                                                                                                                          containerStudentRecord.studentLastName,
                                                                                                                                          'rotert',
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Outfit',
                                                                                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                                child: Icon(
                                                                                                                                  Icons.location_on_sharp,
                                                                                                                                  color: containerStudentRecord.reference == _model.studentRef?.reference ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  size: 24.0,
                                                                                                                                ),
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
                                                                                                          ),
                                                                                                        ),
                                                                                                        if ((containerClassesRecord!.classesTimeAB >=
                                                                                                                functions.secondsToMinutes(DistanceAPICall.timeDistanceSec(
                                                                                                                  containerDistanceAPIResponse.jsonBody,
                                                                                                                ))!) &&
                                                                                                            functions.getAvailabilitySlotsBetween(widget.bookings?.where((e) => (e.bookingDayOfWeek == 'Segunda') && (((e.bookingStudentRef == widget.studentDocument?.reference) && (e.bookingTeacherRef != containerClassesRecord.classTeacherDocRef)) || (e.bookingTeacherRef == containerClassesRecord.classTeacherDocRef))).toList().sortedList(keyOf: (e) => e.bookingTime!, desc: false).map((e) => e.bookingTime).withoutNulls.toList().toList(), segFeedbackItem.bookingTime, _model.segTimesValue)!)
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                safeSetState(() {
                                                                                                                  _model.segTimesValueController?.reset();
                                                                                                                });
                                                                                                              },
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Align(
                                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                                child: FaIcon(
                                                                                                                                  FontAwesomeIcons.clock,
                                                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                                                  size: 24.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                '${_model.segTimesValue} até ${functions.add1hToTime(functions.stringTimeToDateTime(_model.segTimesValue))}',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Outfit',
                                                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'o4j3vp07' /* Selecionado */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Outfit',
                                                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                        child: Icon(
                                                                                                                          Icons.location_on_sharp,
                                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                                          size: 24.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        if (containerClassesRecord!.classesTimeAB >=
                                                                                            functions.secondsToMinutes(DistanceAPICall.timeDistanceSec(
                                                                                              containerDistanceAPIResponse.jsonBody,
                                                                                            ))!)
                                                                                          Align(
                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'id060zpe' /* Horários disponiveis: */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        if (containerClassesRecord.classesTimeAB >=
                                                                                            functions.secondsToMinutes(DistanceAPICall.timeDistanceSec(
                                                                                              containerDistanceAPIResponse.jsonBody,
                                                                                            ))!)
                                                                                          FlutterFlowChoiceChips(
                                                                                            options: functions
                                                                                                .getAvailabileSlots(
                                                                                                    widget.bookings!.where((e) => (e.bookingDayOfWeek == 'Segunda') && ((e.bookingTeacherRef == containerClassesRecord.classTeacherDocRef) || (e.bookingStudentRef == widget.studentDocument?.reference))).toList().map((e) => e.bookingTime).withoutNulls.toList(),
                                                                                                    'Segunda',
                                                                                                    containerClassesRecord.classAvailability.toList(),
                                                                                                    widget.studentDocument!.studentAvailability.toList(),
                                                                                                    functions.secondsToMinutes(DistanceAPICall.timeDistanceSec(
                                                                                                      containerDistanceAPIResponse.jsonBody,
                                                                                                    )))!
                                                                                                .map((e) => dateTimeFormat(
                                                                                                      "Hm",
                                                                                                      e,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ))
                                                                                                .toList()
                                                                                                .map((label) => ChipData(label))
                                                                                                .toList(),
                                                                                            onChanged: (val) => safeSetState(() => _model.segTimesValue = val?.firstOrNull),
                                                                                            selectedChipStyle: ChipStyle(
                                                                                              backgroundColor: FlutterFlowTheme.of(context).accent3,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              iconColor: const Color(0x00000000),
                                                                                              iconSize: 16.0,
                                                                                              elevation: 0.0,
                                                                                              borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                              borderWidth: 2.0,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            unselectedChipStyle: ChipStyle(
                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              iconColor: const Color(0x00000000),
                                                                                              iconSize: 16.0,
                                                                                              labelPadding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                              elevation: 0.0,
                                                                                              borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderWidth: 2.0,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            chipSpacing: 4.0,
                                                                                            rowSpacing: 4.0,
                                                                                            multiselect: false,
                                                                                            alignment: WrapAlignment.spaceEvenly,
                                                                                            controller: _model.segTimesValueController ??= FormFieldController<List<String>>(
                                                                                              [],
                                                                                            ),
                                                                                            wrapped: true,
                                                                                          ),
                                                                                        if (containerClassesRecord.classesTimeAB <
                                                                                            functions.secondsToMinutes(DistanceAPICall.timeDistanceSec(
                                                                                              containerDistanceAPIResponse.jsonBody,
                                                                                            ))!)
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '3k6xpx8h' /* Tempo entre aulas maior que de... */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  '(${containerClassesRecord.classesTimeAB.toString()} min).',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Flexible(
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'fp00fbbi' /* Cancelar */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 50.0,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  if (_model.chatReference == null) {
                                                                                    // newChat

                                                                                    var chatsRecordReference = ChatsRecord.collection.doc();
                                                                                    await chatsRecordReference.set({
                                                                                      ...createChatsRecordData(
                                                                                        userA: _model.userRefSelected1?.reference,
                                                                                        userB: widget.studentDocument?.studentParentRef,
                                                                                        lastMessage: '',
                                                                                        lastMessageTime: getCurrentTimestamp,
                                                                                        lastMessageSentBy: currentUserReference,
                                                                                        groupChatId: random_data.randomInteger(1000000, 9999999),
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'users': _model.listChatRef,
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    _model.newChatThread1 = ChatsRecord.getDocumentFromData({
                                                                                      ...createChatsRecordData(
                                                                                        userA: _model.userRefSelected1?.reference,
                                                                                        userB: widget.studentDocument?.studentParentRef,
                                                                                        lastMessage: '',
                                                                                        lastMessageTime: getCurrentTimestamp,
                                                                                        lastMessageSentBy: currentUserReference,
                                                                                        groupChatId: random_data.randomInteger(1000000, 9999999),
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'users': _model.listChatRef,
                                                                                        },
                                                                                      ),
                                                                                    }, chatsRecordReference);
                                                                                  }
                                                                                  if (_model.segTimesValue != null && _model.segTimesValue != '') {
                                                                                    var bookingsRecordReference = BookingsRecord.collection.doc();
                                                                                    await bookingsRecordReference.set(createBookingsRecordData(
                                                                                      bookingDayOfWeek: 'Segunda',
                                                                                      bookingTime: functions.stringTimeToDateTime(_model.segTimesValue),
                                                                                      bookingStudentRef: widget.studentDocument?.reference,
                                                                                      bookingTeacherRef: containerClassesRecord?.classTeacherDocRef,
                                                                                      bookingTeacherLocal: FFAppState().apiLocation,
                                                                                      bookingStudentLocal: containerCidadeRecord.enderecoCompleto,
                                                                                      bookingParentRef: widget.studentDocument?.studentParentRef,
                                                                                      bookingActive: true,
                                                                                      bookingCreatedDateTime: getCurrentTimestamp,
                                                                                    ));
                                                                                    _model.bookingSeg = BookingsRecord.getDocumentFromData(
                                                                                        createBookingsRecordData(
                                                                                          bookingDayOfWeek: 'Segunda',
                                                                                          bookingTime: functions.stringTimeToDateTime(_model.segTimesValue),
                                                                                          bookingStudentRef: widget.studentDocument?.reference,
                                                                                          bookingTeacherRef: containerClassesRecord?.classTeacherDocRef,
                                                                                          bookingTeacherLocal: FFAppState().apiLocation,
                                                                                          bookingStudentLocal: containerCidadeRecord.enderecoCompleto,
                                                                                          bookingParentRef: widget.studentDocument?.studentParentRef,
                                                                                          bookingActive: true,
                                                                                          bookingCreatedDateTime: getCurrentTimestamp,
                                                                                        ),
                                                                                        bookingsRecordReference);

                                                                                    await containerClassesRecord!.reference.update(createClassesRecordData(
                                                                                      classesBookingRef: createListBookingRefStruct(
                                                                                        fieldValues: {
                                                                                          'bookingRef': FieldValue.arrayUnion([
                                                                                            _model.bookingSeg?.reference
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.studentDocument!.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'studentBookingRef': FieldValue.arrayUnion([
                                                                                            _model.bookingSeg?.reference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  }

                                                                                  await widget.studentFromTicket!.reference.update(createClassesRequesterRecordData(
                                                                                    isArchived: true,
                                                                                  ));
                                                                                  FFAppState().clearRequesterListCache();
                                                                                  FFAppState().clearBookingtestCache();
                                                                                  Navigator.pop(context);

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'qual4586' /* Agendar */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 50.0,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(width: 16.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
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
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
