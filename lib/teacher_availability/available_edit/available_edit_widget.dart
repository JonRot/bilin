import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/localizacao/comp/local/local_widget.dart';
import '/localizacao/comp/locatio_one/locatio_one_widget.dart';
import '/teacher_availability/comp/calendar_time/calendar_time_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'available_edit_model.dart';
export 'available_edit_model.dart';

class AvailableEditWidget extends StatefulWidget {
  const AvailableEditWidget({super.key});

  @override
  State<AvailableEditWidget> createState() => _AvailableEditWidgetState();
}

class _AvailableEditWidgetState extends State<AvailableEditWidget> {
  late AvailableEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailableEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.s1 = FFAppState().availability.elementAtOrNull(0)?.startTime;
      _model.s2 = FFAppState().availability.elementAtOrNull(0)?.endTime;
      _model.t1 = FFAppState().availability.elementAtOrNull(1)?.startTime;
      _model.t2 = FFAppState().availability.elementAtOrNull(1)?.endTime;
      _model.qua1 = FFAppState().availability.elementAtOrNull(2)?.startTime;
      _model.qua2 = FFAppState().availability.elementAtOrNull(2)?.endTime;
      _model.qui1 = FFAppState().availability.elementAtOrNull(3)?.startTime;
      _model.qui2 = FFAppState().availability.elementAtOrNull(3)?.endTime;
      _model.sex1 = FFAppState().availability.elementAtOrNull(4)?.startTime;
      _model.sex2 = FFAppState().availability.elementAtOrNull(4)?.endTime;
      safeSetState(() {});
      _model.classesQ = await queryClassesRecordOnce(
        queryBuilder: (classesRecord) => classesRecord.where(
          'classTeacherDocRef',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().availability = _model.classesQ!.classAvailability
          .toList()
          .cast<AvailabilityStruct>();
      safeSetState(() {});
    });

    _model.recadoTextController ??= TextEditingController();
    _model.recadoFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<RequestAvailabilityRecord>(
        stream: RequestAvailabilityRecord.getDocument(
            currentUserDocument!.userRefRequestAvailability!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: const Center(
                child: SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0x6C57636C),
                    ),
                  ),
                ),
              ),
            );
          }

          final availableEditRequestAvailabilityRecord = snapshot.data!;

          return Scaffold(
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
                  'e49vunf7' /* Disponibilidade */,
                ),
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 25.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: StreamBuilder<List<ClassesRecord>>(
              stream: queryClassesRecord(
                queryBuilder: (classesRecord) => classesRecord.where(
                  'classTeacherDocRef',
                  isEqualTo: availableEditRequestAvailabilityRecord
                      .requestTeacherDocRef,
                ),
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0x6C57636C),
                        ),
                      ),
                    ),
                  );
                }
                List<ClassesRecord> stackClassesRecordList = snapshot.data!;
                final stackClassesRecord = stackClassesRecordList.isNotEmpty
                    ? stackClassesRecordList.first
                    : null;

                return Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Builder(
                                builder: (context) {
                                  if (availableEditRequestAvailabilityRecord
                                          .requestStatus ==
                                      Status.EmAnalise) {
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      valueOrDefault<double>(
                                                    availableEditRequestAvailabilityRecord
                                                                    .requestComment !=
                                                                ''
                                                        ? 0.0
                                                        : 8.0,
                                                    0.0,
                                                  )),
                                                  bottomRight: Radius.circular(
                                                      valueOrDefault<double>(
                                                    availableEditRequestAvailabilityRecord
                                                                    .requestComment !=
                                                                ''
                                                        ? 0.0
                                                        : 8.0,
                                                    0.0,
                                                  )),
                                                  topLeft: const Radius.circular(8.0),
                                                  topRight:
                                                      const Radius.circular(8.0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      availableEditRequestAvailabilityRecord
                                                                  .requestStatus ==
                                                              Status.EmAnalise
                                                          ? 'Em Analise'
                                                          : '',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if ((availableEditRequestAvailabilityRecord
                                                              .requestComment !=
                                                          '') &&
                                                  ((currentUserDocument?.role ==
                                                          Role.Admin) ||
                                                      (currentUserDocument
                                                              ?.role ==
                                                          Role.SuperAdmin))) {
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'kuzo65n9' /* Observação: */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            availableEditRequestAvailabilityRecord
                                                                .requestComment,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 2.0,
                                                                24.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rve0s69i' /* Para alterar a disponibilidade... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  } else if (availableEditRequestAvailabilityRecord
                                          .requestStatus ==
                                      Status.Aprovado) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  availableEditRequestAvailabilityRecord
                                                      .requestStatus?.name,
                                                  'Aprovado',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else if (availableEditRequestAvailabilityRecord
                                          .requestStatus ==
                                      Status.Rejeitado) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  availableEditRequestAvailabilityRecord
                                                      .requestStatus?.name,
                                                  'Rejeitado',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  availableEditRequestAvailabilityRecord
                                                      .requestStatus?.name,
                                                  'Criar',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            if (!((availableEditRequestAvailabilityRecord
                                        .requestStatus ==
                                    Status.Rejeitado) ||
                                (availableEditRequestAvailabilityRecord
                                        .requestStatus ==
                                    Status.EmAnalise)))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 8.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.recadoTextController,
                                    focusNode: _model.recadoFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '3uubdsbj' /* Deixe uma observação para o Ad... */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '0ts9ej3j' /* Observação */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .recadoTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 8.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'k2b5calg' /* SEG */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '61k7ra16' /* TER */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'th0uhnyy' /* QUA */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'o8v5aypx' /* QUI */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '11bzgeoq' /* SEX */,
                                          ))
                                        ],
                                        onChanged: (val) => safeSetState(() =>
                                            _model.dayValue = val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          iconColor: const Color(0x00000000),
                                          iconSize: 20.0,
                                          labelPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          elevation: 0.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          borderWidth: 1.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor: const Color(0x00000000),
                                          iconSize: 18.0,
                                          labelPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          elevation: 0.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderWidth: 2.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        chipSpacing: 8.0,
                                        rowSpacing: 8.0,
                                        multiselect: false,
                                        initialized: _model.dayValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .dayValueController ??=
                                            FormFieldController<List<String>>(
                                          [
                                            FFLocalizations.of(context).getText(
                                              'pig5dw5o' /* SEG */,
                                            )
                                          ],
                                        ),
                                        wrapped: false,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.dayValue == 'SEG')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '43po6mwe' /* Segunda */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.s1 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              0,
                                                              (e) => e
                                                                ..startTime =
                                                                    _model.s1,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(0)
                                                                              ?.startTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Começar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            0)!
                                                                        .hasStartTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(0)
                                                                            ?.startTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .s1,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Começar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          0)
                                                                      ?.startTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              0))
                                                                      ?.startTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          0)
                                                                      ?.startTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(0)?.startTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(0))?.startTime !=
                                                                            FFAppState().availability.elementAtOrNull(0)?.startTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tb57t8ob' /* até */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.s2 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              0,
                                                              (e) => e
                                                                ..endTime =
                                                                    _model.s2,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(0)
                                                                              ?.endTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Terminar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            0)!
                                                                        .hasEndTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(0)
                                                                            ?.endTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .s2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Terminar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          0)
                                                                      ?.endTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              0))
                                                                      ?.endTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          0)
                                                                      ?.endTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(0)?.endTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(0))?.endTime !=
                                                                            FFAppState().availability.elementAtOrNull(0)?.endTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Colors
                                                                    .transparent,
                                                                isDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const LocalWidget(),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.cidadeSelected1 =
                                                                          value));

                                                              FFAppState()
                                                                  .updateAvailabilityAtIndex(
                                                                0,
                                                                (e) => e
                                                                  ..local = _model
                                                                      .cidadeSelected1
                                                                      ?.enderecoCompleto,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  maxWidth:
                                                                      500.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (_model
                                                                              .cidadeSelected1
                                                                              ?.reference !=
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.locatioOneModel1,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: LocatioOneWidget(
                                                                                cidadeDoc: _model.cidadeSelected1!,
                                                                                isDefault: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .cidadeSelected1
                                                                              ?.reference ==
                                                                          null)
                                                                        Flexible(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_pin,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ip5u5tuf' /* Area da Aula */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Wrap(
                                                                                      spacing: 0.0,
                                                                                      runSpacing: 0.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              stackClassesRecord!.classAvailability.elementAtOrNull(0)!.hasLocal() ? (stackClassesRecord.classAvailability.elementAtOrNull(0))?.local : 'Selecione o local da aula nesse dia',
                                                                                              'Selecione o local da aula nesse dia',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: const Color(0xFF989898),
                                                                                                  fontSize: 12.0,
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
                                                                    ],
                                                                  ),
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
                                        ),
                                      if (_model.dayValue == 'TER')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ds7zvpt0' /* Terça */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.t1 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              1,
                                                              (e) => e
                                                                ..startTime =
                                                                    _model.t1,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(1)
                                                                              ?.startTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Começar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            1)!
                                                                        .hasStartTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(1)
                                                                            ?.startTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .t1,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Começar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          1)
                                                                      ?.startTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              1))
                                                                      ?.startTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          1)
                                                                      ?.startTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(1)?.startTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(1))?.startTime !=
                                                                            FFAppState().availability.elementAtOrNull(1)?.startTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xurgizcj' /* até */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.t2 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              1,
                                                              (e) => e
                                                                ..endTime =
                                                                    _model.t2,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(1)
                                                                              ?.endTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Terminar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            1)!
                                                                        .hasEndTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(1)
                                                                            ?.endTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .t2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Terminar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          1)
                                                                      ?.endTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              1))
                                                                      ?.endTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          1)
                                                                      ?.endTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(1)?.endTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(1))?.endTime !=
                                                                            FFAppState().availability.elementAtOrNull(1)?.endTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Colors
                                                                    .transparent,
                                                                isDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const LocalWidget(),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.cidadeSelected2 =
                                                                          value));

                                                              FFAppState()
                                                                  .updateAvailabilityAtIndex(
                                                                1,
                                                                (e) => e
                                                                  ..local = _model
                                                                      .cidadeSelected2
                                                                      ?.enderecoCompleto,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  maxWidth:
                                                                      500.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (_model
                                                                              .cidadeSelected2
                                                                              ?.reference !=
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.locatioOneModel2,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: LocatioOneWidget(
                                                                                cidadeDoc: _model.cidadeSelected2!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .cidadeSelected2
                                                                              ?.reference ==
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_pin,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'pjsbhfbb' /* Area da Aula */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Wrap(
                                                                                      spacing: 0.0,
                                                                                      runSpacing: 0.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              stackClassesRecord!.classAvailability.elementAtOrNull(1)!.hasLocal() ? (stackClassesRecord.classAvailability.elementAtOrNull(1))?.local : 'Selecione o local da aula nesse dia',
                                                                                              'Selecione o local da aula nesse dia',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: const Color(0xFF989898),
                                                                                                  fontSize: 12.0,
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
                                                                    ],
                                                                  ),
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
                                        ),
                                      if (_model.dayValue == 'QUA')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xicrziju' /* Quarta */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.qua1 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              2,
                                                              (e) => e
                                                                ..startTime =
                                                                    _model.qua1,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(2)
                                                                              ?.startTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Começar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            2)!
                                                                        .hasStartTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(2)
                                                                            ?.startTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .qua1,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Começar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          2)
                                                                      ?.startTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              2))
                                                                      ?.startTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          2)
                                                                      ?.startTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(2)?.startTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(2))?.startTime !=
                                                                            FFAppState().availability.elementAtOrNull(2)?.startTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'cm1eqj1t' /* até */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.qua2 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              2,
                                                              (e) => e
                                                                ..endTime =
                                                                    _model.qua2,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(2)
                                                                              ?.endTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Terminar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            2)!
                                                                        .hasEndTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(2)
                                                                            ?.endTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .qua2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Terminar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          2)
                                                                      ?.endTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              2))
                                                                      ?.endTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          2)
                                                                      ?.endTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(2)?.endTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(2))?.endTime !=
                                                                            FFAppState().availability.elementAtOrNull(2)?.endTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Colors
                                                                    .transparent,
                                                                isDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const LocalWidget(),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.cidadeSelected3 =
                                                                          value));

                                                              FFAppState()
                                                                  .updateAvailabilityAtIndex(
                                                                2,
                                                                (e) => e
                                                                  ..local = _model
                                                                      .cidadeSelected3
                                                                      ?.enderecoCompleto,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  maxWidth:
                                                                      500.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (_model
                                                                              .cidadeSelected3
                                                                              ?.reference !=
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.locatioOneModel3,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: LocatioOneWidget(
                                                                                cidadeDoc: _model.cidadeSelected3!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .cidadeSelected3
                                                                              ?.reference ==
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_pin,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '0wv3v2xj' /* Area da Aula */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Wrap(
                                                                                      spacing: 0.0,
                                                                                      runSpacing: 0.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              stackClassesRecord!.classAvailability.elementAtOrNull(2)!.hasLocal() ? (stackClassesRecord.classAvailability.elementAtOrNull(2))?.local : 'Selecione o local da aula nesse dia',
                                                                                              'Selecione o local da aula nesse dia',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: const Color(0xFF989898),
                                                                                                  fontSize: 12.0,
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
                                                                    ],
                                                                  ),
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
                                        ),
                                      if (_model.dayValue == 'QUI')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'm3w9qwrm' /* Quinta */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.qui1 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              3,
                                                              (e) => e
                                                                ..startTime =
                                                                    _model.qui1,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(3)
                                                                              ?.startTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Começar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            3)!
                                                                        .hasStartTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(3)
                                                                            ?.startTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .qui1,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Começar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.startTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              3))
                                                                      ?.startTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.startTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(3)?.startTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(3))?.startTime !=
                                                                            FFAppState().availability.elementAtOrNull(3)?.startTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gvbpe91b' /* até */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.qui2 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              3,
                                                              (e) => e
                                                                ..endTime =
                                                                    _model.qui2,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(3)
                                                                              ?.endTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Terminar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            3)!
                                                                        .hasEndTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(3)
                                                                            ?.endTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .qui2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Terminar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.endTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              3))
                                                                      ?.endTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          3)
                                                                      ?.endTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(3)?.endTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(3))?.endTime !=
                                                                            FFAppState().availability.elementAtOrNull(3)?.endTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Colors
                                                                    .transparent,
                                                                isDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const LocalWidget(),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.cidadeSelected4 =
                                                                          value));

                                                              FFAppState()
                                                                  .updateAvailabilityAtIndex(
                                                                3,
                                                                (e) => e
                                                                  ..local = _model
                                                                      .cidadeSelected4
                                                                      ?.enderecoCompleto,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  maxWidth:
                                                                      500.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (_model
                                                                              .cidadeSelected4
                                                                              ?.reference !=
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.locatioOneModel4,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: LocatioOneWidget(
                                                                                cidadeDoc: _model.cidadeSelected4!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .cidadeSelected4
                                                                              ?.reference ==
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_pin,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'xsd99mig' /* Area da Aula */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Wrap(
                                                                                      spacing: 0.0,
                                                                                      runSpacing: 0.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              stackClassesRecord!.classAvailability.elementAtOrNull(3)!.hasLocal() ? (stackClassesRecord.classAvailability.elementAtOrNull(3))?.local : 'Selecione o local da aula nesse dia',
                                                                                              'Selecione o local da aula nesse dia',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: const Color(0xFF989898),
                                                                                                  fontSize: 12.0,
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
                                                                    ],
                                                                  ),
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
                                        ),
                                      if (_model.dayValue == 'SEX')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '388bs0px' /* Sexta */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.sex1 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              4,
                                                              (e) => e
                                                                ..startTime =
                                                                    _model.sex1,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(4)
                                                                              ?.startTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Começar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            4)!
                                                                        .hasStartTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(4)
                                                                            ?.startTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .sex1,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Começar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          4)
                                                                      ?.startTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              4))
                                                                      ?.startTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          4)
                                                                      ?.startTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(4)?.startTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(4))?.startTime !=
                                                                            FFAppState().availability.elementAtOrNull(4)?.startTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '3rs664li' /* até */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
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
                                                                      const CalendarTimeWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.sex2 =
                                                                FFAppState()
                                                                    .time;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateAvailabilityAtIndex(
                                                              4,
                                                              (e) => e
                                                                ..endTime =
                                                                    _model.sex2,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                          "Hm",
                                                                          FFAppState()
                                                                              .availability
                                                                              .elementAtOrNull(4)
                                                                              ?.endTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        ''
                                                                ? 'Terminar'
                                                                : (FFAppState()
                                                                        .availability
                                                                        .elementAtOrNull(
                                                                            4)!
                                                                        .hasEndTime()
                                                                    ? dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .availability
                                                                            .elementAtOrNull(4)
                                                                            ?.endTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "Hm",
                                                                        _model
                                                                            .sex2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )),
                                                            'Terminar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: () {
                                                              if (FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          4)
                                                                      ?.endTime ==
                                                                  null) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if ((stackClassesRecord
                                                                          ?.classAvailability
                                                                          .elementAtOrNull(
                                                                              4))
                                                                      ?.endTime !=
                                                                  FFAppState()
                                                                      .availability
                                                                      .elementAtOrNull(
                                                                          4)
                                                                      ?.endTime) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color:
                                                                          () {
                                                                        if (FFAppState().availability.elementAtOrNull(4)?.endTime ==
                                                                            null) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if ((stackClassesRecord?.classAvailability.elementAtOrNull(4))?.endTime !=
                                                                            FFAppState().availability.elementAtOrNull(4)?.endTime) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Colors
                                                                    .transparent,
                                                                isDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const LocalWidget(),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.cidadeSelected5 =
                                                                          value));

                                                              FFAppState()
                                                                  .updateAvailabilityAtIndex(
                                                                4,
                                                                (e) => e
                                                                  ..local = _model
                                                                      .cidadeSelected5
                                                                      ?.enderecoCompleto,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  maxWidth:
                                                                      500.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (_model
                                                                              .cidadeSelected5
                                                                              ?.reference !=
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.locatioOneModel5,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: LocatioOneWidget(
                                                                                cidadeDoc: _model.cidadeSelected5!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .cidadeSelected5
                                                                              ?.reference ==
                                                                          null)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_pin,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'gsuzw680' /* Area da Aula */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Wrap(
                                                                                      spacing: 0.0,
                                                                                      runSpacing: 0.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              stackClassesRecord!.classAvailability.elementAtOrNull(4)!.hasLocal() ? (stackClassesRecord.classAvailability.elementAtOrNull(4))?.local : 'Selecione o local da aula nesse dia',
                                                                                              'Selecione o local da aula nesse dia',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: const Color(0xFF989898),
                                                                                                  fontSize: 12.0,
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
                                                                    ],
                                                                  ),
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
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (availableEditRequestAvailabilityRecord
                                    .requestStatus ==
                                Status.Rejeitado)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'uyour1m9' /* Continue para visualizar sua D... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        HapticFeedback.selectionClick();
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Solicitação Negada'),
                                              content: Text(stackClassesRecord!
                                                  .classRecado),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (stackClassesRecord
                                                ?.classRequestAvailabilityRef ==
                                            availableEditRequestAvailabilityRecord
                                                .reference) {
                                          await availableEditRequestAvailabilityRecord
                                              .reference
                                              .update({
                                            ...createRequestAvailabilityRecordData(
                                              requestStatus: Status.Aprovado,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'requestAvailability':
                                                    getAvailabilityListFirestoreData(
                                                  stackClassesRecord
                                                      ?.classAvailability,
                                                ),
                                              },
                                            ),
                                          });
                                          FFAppState().availability =
                                              stackClassesRecord!
                                                  .classAvailability
                                                  .toList()
                                                  .cast<AvailabilityStruct>();
                                          safeSetState(() {});
                                          HapticFeedback.selectionClick();
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Aula não criada'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '19kb7l82' /* Continuar */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (!((availableEditRequestAvailabilityRecord
                                        .requestStatus ==
                                    Status.Rejeitado) ||
                                (availableEditRequestAvailabilityRecord
                                        .requestStatus ==
                                    Status.EmAnalise)))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    HapticFeedback.selectionClick();
                                    if ((_model.s1! < _model.s2!) ||
                                        (_model.t1! < _model.t2!) ||
                                        (_model.qua1! < _model.qua2!) ||
                                        (_model.qui1! < _model.qui2!) ||
                                        (_model.sex1! < _model.sex2!)) {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Deseja enviar sua Disponibilidade?'),
                                                    content: const Text(
                                                        'Sua solicitação entrara em analise até que um administrador aprove ou rejeite sua solicitação.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: const Text('Cancelar'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child:
                                                            const Text('Confirmar'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await availableEditRequestAvailabilityRecord
                                            .reference
                                            .update({
                                          ...createRequestAvailabilityRecordData(
                                            requestStatus: Status.EmAnalise,
                                            createdTime: getCurrentTimestamp,
                                            requestComment: _model
                                                .recadoTextController.text,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'requestAvailability':
                                                  getAvailabilityListFirestoreData(
                                                FFAppState().availability,
                                              ),
                                            },
                                          ),
                                        });
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Enviado!'),
                                              content: const Text(
                                                  'Espera a aprovaçǎo de um administrador para sua nova disponibilidade'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        HapticFeedback.selectionClick();
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Erro'),
                                            content: const Text(
                                                'Tenha certeza que os horários estao corretos!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'e362ryas' /* Solicitar Nova Disponibilidade */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
