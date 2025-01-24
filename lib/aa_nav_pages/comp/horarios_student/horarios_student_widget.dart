import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/teacher_availability/comp/calendar_time/calendar_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'horarios_student_model.dart';
export 'horarios_student_model.dart';

class HorariosStudentWidget extends StatefulWidget {
  const HorariosStudentWidget({super.key});

  @override
  State<HorariosStudentWidget> createState() => _HorariosStudentWidgetState();
}

class _HorariosStudentWidgetState extends State<HorariosStudentWidget> {
  late HorariosStudentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorariosStudentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: const BoxDecoration(),
      child: StreamBuilder<List<ClassesRecord>>(
        stream: queryClassesRecord(
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
          List<ClassesRecord> containerClassesRecordList = snapshot.data!;
          final containerClassesRecord = containerClassesRecordList.isNotEmpty
              ? containerClassesRecordList.first
              : null;

          return Container(
            decoration: const BoxDecoration(),
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData(FFLocalizations.of(context).getText(
                            'hlar78ws' /* SEG */,
                          )),
                          ChipData(FFLocalizations.of(context).getText(
                            'd7fz0y0a' /* TER */,
                          )),
                          ChipData(FFLocalizations.of(context).getText(
                            '2o6ccl7n' /* QUA */,
                          )),
                          ChipData(FFLocalizations.of(context).getText(
                            'j4f1y3uh' /* QUI */,
                          )),
                          ChipData(FFLocalizations.of(context).getText(
                            'prlda0g9' /* SEX */,
                          ))
                        ],
                        onChanged: (val) => safeSetState(
                            () => _model.dayValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          iconColor: const Color(0x00000000),
                          iconSize: 20.0,
                          labelPadding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          elevation: 0.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: const Color(0x00000000),
                          iconSize: 18.0,
                          labelPadding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          elevation: 0.0,
                          borderColor:
                              FlutterFlowTheme.of(context).primaryBackground,
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
                            FFLocalizations.of(context).getText(
                              '91ty0n50' /* SEG */,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'yygzgpap' /* Segunda */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.seg1 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              0,
                                              (e) => e..startTime = _model.seg1,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  0)
                                                              ?.startTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Começar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(0)!
                                                        .hasStartTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(0)
                                                            ?.startTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.seg1,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Começar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(0)
                                                      ?.startTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(0))
                                                      ?.startTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(0)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(0)
                                                            ?.startTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    0))
                                                            ?.startTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(0)
                                                            ?.startTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'gv3xgyed' /* até */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.seg2 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              0,
                                              (e) => e..endTime = _model.seg2,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  0)
                                                              ?.endTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Terminar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(0)!
                                                        .hasEndTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(0)
                                                            ?.endTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.seg2,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Terminar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(0)
                                                      ?.endTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(0))
                                                      ?.endTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(0)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(0)
                                                            ?.endTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    0))
                                                            ?.endTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(0)
                                                            ?.endTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                      if (_model.dayValue == 'TER')
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'lzvtu6tl' /* Terça */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.ter1 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              1,
                                              (e) => e..startTime = _model.ter1,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  1)
                                                              ?.startTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Começar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(1)!
                                                        .hasStartTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(1)
                                                            ?.startTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : _model.ter1?.toString()),
                                            'Começar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(1)
                                                      ?.startTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(1))
                                                      ?.startTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(1)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(1)
                                                            ?.startTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    1))
                                                            ?.startTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(1)
                                                            ?.startTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'xuq12z15' /* até */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.ter2 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              1,
                                              (e) => e..endTime = _model.ter2,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  1)
                                                              ?.endTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Terminar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(1)!
                                                        .hasEndTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(1)
                                                            ?.endTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.ter2,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Terminar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(1)
                                                      ?.endTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(1))
                                                      ?.endTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(1)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(1)
                                                            ?.endTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    1))
                                                            ?.endTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(1)
                                                            ?.endTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                      if (_model.dayValue == 'QUA')
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '5ecut3tv' /* Quarta */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.qua1 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              2,
                                              (e) => e..startTime = _model.qua1,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  2)
                                                              ?.startTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Começar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(2)!
                                                        .hasStartTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(2)
                                                            ?.startTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.qua1,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Começar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(2)
                                                      ?.startTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(2))
                                                      ?.startTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(2)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(2)
                                                            ?.startTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    2))
                                                            ?.startTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(2)
                                                            ?.startTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'jgk4h4hw' /* até */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.qua2 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              2,
                                              (e) => e..endTime = _model.qua2,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  2)
                                                              ?.endTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Terminar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(2)!
                                                        .hasEndTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(2)
                                                            ?.endTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.qua2,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Terminar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(2)
                                                      ?.endTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(2))
                                                      ?.endTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(2)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(2)
                                                            ?.endTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    2))
                                                            ?.endTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(2)
                                                            ?.endTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                      if (_model.dayValue == 'QUI')
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'cppjxvre' /* Quinta */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.qui1 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              3,
                                              (e) => e..startTime = _model.qui1,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  3)
                                                              ?.startTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Começar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(3)!
                                                        .hasStartTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(3)
                                                            ?.startTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.qui1,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Começar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(3)
                                                      ?.startTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(3))
                                                      ?.startTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(3)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(3)
                                                            ?.startTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    3))
                                                            ?.startTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(3)
                                                            ?.startTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'or391urn' /* até */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.qui2 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              3,
                                              (e) => e..endTime = _model.qui2,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  3)
                                                              ?.endTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Terminar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(3)!
                                                        .hasEndTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(3)
                                                            ?.endTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.qui2,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Terminar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(3)
                                                      ?.endTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(3))
                                                      ?.endTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(3)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(3)
                                                            ?.endTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    3))
                                                            ?.endTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(3)
                                                            ?.endTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                      if (_model.dayValue == 'SEX')
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              14.0, 8.0, 14.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'y4vxbpw2' /* Sexta */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.sex1 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              4,
                                              (e) => e..startTime = _model.sex1,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  4)
                                                              ?.startTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Começar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(4)!
                                                        .hasStartTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(4)
                                                            ?.startTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.sex1,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Começar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(4)
                                                      ?.startTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(4))
                                                      ?.startTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(4)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(4)
                                                            ?.startTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    4))
                                                            ?.startTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(4)
                                                            ?.startTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '74ceuu4q' /* até */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                                  child: const CalendarTimeWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            _model.sex2 = FFAppState().time;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAvailabilityAtIndex(
                                              4,
                                              (e) => e..endTime = _model.sex2,
                                            );
                                            safeSetState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                                          "Hm",
                                                          FFAppState()
                                                              .availability
                                                              .elementAtOrNull(
                                                                  4)
                                                              ?.endTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        ''
                                                ? 'Terminar'
                                                : (FFAppState()
                                                        .availability
                                                        .elementAtOrNull(4)!
                                                        .hasEndTime()
                                                    ? dateTimeFormat(
                                                        "Hm",
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(4)
                                                            ?.endTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        "Hm",
                                                        _model.sex2,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                            'Terminar',
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (FFAppState()
                                                      .availability
                                                      .elementAtOrNull(4)
                                                      ?.endTime ==
                                                  null) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((containerClassesRecord
                                                          ?.classAvailability
                                                          .elementAtOrNull(4))
                                                      ?.endTime !=
                                                  FFAppState()
                                                      .availability
                                                      .elementAtOrNull(4)
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: () {
                                                    if (FFAppState()
                                                            .availability
                                                            .elementAtOrNull(4)
                                                            ?.endTime ==
                                                        null) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if ((containerClassesRecord
                                                                ?.classAvailability
                                                                .elementAtOrNull(
                                                                    4))
                                                            ?.endTime !=
                                                        FFAppState()
                                                            .availability
                                                            .elementAtOrNull(4)
                                                            ?.endTime) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryText;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
