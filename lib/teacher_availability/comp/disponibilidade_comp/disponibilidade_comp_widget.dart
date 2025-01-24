import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'disponibilidade_comp_model.dart';
export 'disponibilidade_comp_model.dart';

class DisponibilidadeCompWidget extends StatefulWidget {
  const DisponibilidadeCompWidget({super.key});

  @override
  State<DisponibilidadeCompWidget> createState() =>
      _DisponibilidadeCompWidgetState();
}

class _DisponibilidadeCompWidgetState extends State<DisponibilidadeCompWidget>
    with TickerProviderStateMixin {
  late DisponibilidadeCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisponibilidadeCompModel());

    _model.recadoTextController ??= TextEditingController();
    _model.recadoFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 350.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.0,
                child: Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'omoi3453' /* Criar Sua Aula Bilin */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Outfit',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData(FFLocalizations.of(context).getText(
                            'vvt0vlab' /* Inglês */,
                          )),
                          ChipData(FFLocalizations.of(context).getText(
                            'rg2v3v9j' /* Espanhol */,
                          )),
                          ChipData(FFLocalizations.of(context).getText(
                            'h5egt3um' /* Francês */,
                          ))
                        ],
                        onChanged: (val) async {
                          safeSetState(() => _model.linguaValues = val);
                          HapticFeedback.selectionClick();
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          iconColor: const Color(0x00000000),
                          iconSize: 18.0,
                          labelPadding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          elevation: 0.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderWidth: 1.0,
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
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          labelPadding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        chipSpacing: 8.0,
                        rowSpacing: 8.0,
                        multiselect: true,
                        initialized: _model.linguaValues != null,
                        alignment: WrapAlignment.start,
                        controller: _model.linguaValueController ??=
                            FormFieldController<List<String>>(
                          [
                            FFLocalizations.of(context).getText(
                              'fg6aq2ia' /* Inglês */,
                            )
                          ],
                        ),
                        wrapped: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 6.0, 8.0, 0.0),
                          child: Container(
                            width: 120.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => Icon(
                                Icons.remove_rounded,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 20.0,
                              ),
                              incrementIconBuilder: (enabled) => Icon(
                                Icons.add_rounded,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 20.0,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              count: _model.idademinValue ??= 1,
                              updateCount: (count) async {
                                safeSetState(
                                    () => _model.idademinValue = count);
                                HapticFeedback.selectionClick();
                              },
                              stepSize: 1,
                              minimum: 1,
                              maximum: 60,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              26.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '1bo5y37r' /* idade minima */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 6.0, 16.0, 0.0),
                            child: Container(
                              width: 120.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => Icon(
                                  Icons.remove_rounded,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => Icon(
                                  Icons.add_rounded,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                count: _model.idademaxValue ??= 12,
                                updateCount: (count) async {
                                  safeSetState(
                                      () => _model.idademaxValue = count);
                                  HapticFeedback.selectionClick();
                                },
                                stepSize: 1,
                                minimum: 2,
                                maximum: 60,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'cpnfsxl7' /* idade maxíma */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'p8ni06qb' /* Tempo maxímo de deslocamento: */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              if (FFAppState().teacherDistanceTime == 15)
                Flexible(
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().teacherDistanceTime = 30;
                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'm9zkrjt6' /* 15 min */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.car,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              if (FFAppState().teacherDistanceTime == 30)
                Flexible(
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().teacherDistanceTime = 45;
                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'kkleoqjx' /* 30 min */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.car,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              if (FFAppState().teacherDistanceTime == 45)
                Flexible(
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().teacherDistanceTime = 60;
                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'z3xxubam' /* 45 min */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.car,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              if (FFAppState().teacherDistanceTime == 60)
                Flexible(
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().teacherDistanceTime = 15;
                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'bl4b6uzw' /* 1 hora */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.car,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.recadoTextController,
                    focusNode: _model.recadoFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: FFLocalizations.of(context).getText(
                        'y4blp05c' /* Deixe um recado para o Adminis... */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'kzfxd4zs' /* Recado */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                    maxLength: 300,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.recadoTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (((_model.linguaValues != null &&
                                      (_model.linguaValues)!.isNotEmpty) !=
                                  null) &&
                              (_model.idademinValue! < _model.idademaxValue!)
                          ? true
                          : false) {
                        var requestAvailabilityRecordReference =
                            RequestAvailabilityRecord.collection.doc();
                        await requestAvailabilityRecordReference.set({
                          ...createRequestAvailabilityRecordData(
                            requestComment: _model.recadoTextController.text,
                            requestMinAge: _model.idademinValue,
                            requestMaxAge: _model.idademaxValue,
                            requestTeacherDocRef: currentUserReference,
                            requestStatus: Status.Criar,
                          ),
                          ...mapToFirestore(
                            {
                              'requestLanguage': _model.linguaValues,
                              'requestAvailability':
                                  getAvailabilityListFirestoreData(
                                functions.initialAvailability(),
                              ),
                            },
                          ),
                        });
                        _model.requestAvailabilityOutput =
                            RequestAvailabilityRecord.getDocumentFromData({
                          ...createRequestAvailabilityRecordData(
                            requestComment: _model.recadoTextController.text,
                            requestMinAge: _model.idademinValue,
                            requestMaxAge: _model.idademaxValue,
                            requestTeacherDocRef: currentUserReference,
                            requestStatus: Status.Criar,
                          ),
                          ...mapToFirestore(
                            {
                              'requestLanguage': _model.linguaValues,
                              'requestAvailability':
                                  getAvailabilityListFirestoreData(
                                functions.initialAvailability(),
                              ),
                            },
                          ),
                        }, requestAvailabilityRecordReference);

                        var classesRecordReference =
                            ClassesRecord.collection.doc();
                        await classesRecordReference.set({
                          ...createClassesRecordData(
                            classTeacherDocRef: currentUserReference,
                            classIdadeMinima: _model.idademinValue,
                            classIdadeMaxima: _model.idademaxValue,
                            classesTimeAB: FFAppState().teacherDistanceTime,
                          ),
                          ...mapToFirestore(
                            {
                              'classAvailability':
                                  getAvailabilityListFirestoreData(
                                functions.initialAvailability(),
                              ),
                            },
                          ),
                        });
                        _model.classesRefOutput =
                            ClassesRecord.getDocumentFromData({
                          ...createClassesRecordData(
                            classTeacherDocRef: currentUserReference,
                            classIdadeMinima: _model.idademinValue,
                            classIdadeMaxima: _model.idademaxValue,
                            classesTimeAB: FFAppState().teacherDistanceTime,
                          ),
                          ...mapToFirestore(
                            {
                              'classAvailability':
                                  getAvailabilityListFirestoreData(
                                functions.initialAvailability(),
                              ),
                            },
                          ),
                        }, classesRecordReference);
                        await Future.delayed(const Duration(milliseconds: 500));

                        await currentUserReference!
                            .update(createUsersRecordData(
                          userRefRequestAvailability:
                              _model.requestAvailabilityOutput?.reference,
                          userRefClasses: _model.classesRefOutput?.reference,
                        ));
                        context.safePop();
                        HapticFeedback.selectionClick();
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Erro'),
                              content: const Text(
                                  'Tenha certeza que colocou todas as informações corretamente'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Verifica'),
                                ),
                              ],
                            );
                          },
                        );
                        HapticFeedback.vibrate();
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'vaivfbfk' /* Criar minha Disponibilidade */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
