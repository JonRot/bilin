import '/aa_nav_pages/comp/horarios_student/horarios_student_widget.dart';
import '/aa_nav_pages/comp/snack_bar/snack_bar_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/localizacao/comp/local/local_widget.dart';
import '/localizacao/comp/locatio_one/locatio_one_widget.dart';
import '/solicitacoes_pais/comp/user_list_student/user_list_student_widget.dart';
import '/solicitacoes_pais/comp/user_sub_aluno/user_sub_aluno_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'agendarmento_pais_model.dart';
export 'agendarmento_pais_model.dart';

class AgendarmentoPaisWidget extends StatefulWidget {
  const AgendarmentoPaisWidget({super.key});

  @override
  State<AgendarmentoPaisWidget> createState() => _AgendarmentoPaisWidgetState();
}

class _AgendarmentoPaisWidgetState extends State<AgendarmentoPaisWidget>
    with TickerProviderStateMixin {
  late AgendarmentoPaisModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendarmentoPaisModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
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
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 110.0),
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
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150.0,
                child: Divider(
                  thickness: 3.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(FFLocalizations.of(context).getText(
                                  '25bl1ajb' /* Inglês */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'x0qjywlz' /* Espanhol */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'ifggifqb' /* Francês */,
                                ))
                              ],
                              onChanged: (val) =>
                                  safeSetState(() => _model.linguaValues = val),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                iconColor: const Color(0x00000000),
                                iconSize: 20.0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 2.0, 8.0, 2.0),
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 18.0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 2.0, 8.0, 2.0),
                                elevation: 0.0,
                                borderColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
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
                                    'vpo5jt3y' /* Inglês */,
                                  )
                                ],
                              ),
                              wrapped: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 75.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      const UserListStudentWidget(),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.studentRefSelected =
                                                    value));

                                            FFAppState().availability = _model
                                                .studentRefSelected!
                                                .studentAvailability
                                                .toList()
                                                .cast<AvailabilityStruct>();
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 65.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (_model
                                                              .studentRefSelected
                                                              ?.reference !=
                                                          null)
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        8.0,
                                                                        0.0,
                                                                        4.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .userSubAlunoModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  UserSubAlunoWidget(
                                                                userRef: _model
                                                                    .studentRefSelected,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (_model
                                                              .studentRefSelected
                                                              ?.reference ==
                                                          null)
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'zgz00mrx' /* Adicionar */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons.mode_edit_outline,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 32.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                              ],
                                              stops: const [0.0, 1.0],
                                              begin: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: const AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 2.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gqaevh57' /* Escolha o Filho(a): */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['stackOnPageLoadAnimation']!),
                              ),
                              if (_model.studentRefSelected?.reference != null)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '9g0yy7ry' /* Dias de interese: */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 4.0),
                                      child: wrapWithModel(
                                        model: _model.horariosStudentModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const HorariosStudentWidget(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Colors.transparent,
                                            isDismissible: false,
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
                                                          0.5,
                                                  child: const LocalWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.cidadeSelectedStudent =
                                                  value));

                                          safeSetState(() {});
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 500.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  if (_model
                                                          .cidadeSelectedStudent
                                                          ?.reference !=
                                                      null)
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .locatioOneModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              LocatioOneWidget(
                                                            cidadeDoc: _model
                                                                .cidadeSelectedStudent!,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model
                                                          .cidadeSelectedStudent
                                                          ?.reference ==
                                                      null)
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .location_pin,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
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
                                                                      '33v366vd' /* Escolha a localização */,
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
                                                                Padding(
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
                                                                      'ejh6rfmk' /* Selecione o local da(s) aula(s... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              const Color(0xFF989898),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
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
              if ((_model.studentRefSelected?.reference != null) &&
                  (_model.cidadeSelectedStudent?.reference != null))
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.cidadeSelectedStudent?.reference != null) {
                          var classesRequesterRecordReference =
                              ClassesRequesterRecord.collection.doc();
                          await classesRequesterRecordReference.set({
                            ...createClassesRequesterRecordData(
                              createdTime: getCurrentTimestamp,
                              isArchived: false,
                              requesterStudent:
                                  _model.studentRefSelected?.reference,
                              requesterParent: currentUserReference,
                              requesterLocation:
                                  _model.cidadeSelectedStudent?.reference,
                            ),
                            ...mapToFirestore(
                              {
                                'requesterLanguage': _model.linguaValues,
                                'requesterAvailability':
                                    getAvailabilityListFirestoreData(
                                  FFAppState().availability,
                                ),
                              },
                            ),
                          });
                          _model.classRequesterUser =
                              ClassesRequesterRecord.getDocumentFromData({
                            ...createClassesRequesterRecordData(
                              createdTime: getCurrentTimestamp,
                              isArchived: false,
                              requesterStudent:
                                  _model.studentRefSelected?.reference,
                              requesterParent: currentUserReference,
                              requesterLocation:
                                  _model.cidadeSelectedStudent?.reference,
                            ),
                            ...mapToFirestore(
                              {
                                'requesterLanguage': _model.linguaValues,
                                'requesterAvailability':
                                    getAvailabilityListFirestoreData(
                                  FFAppState().availability,
                                ),
                              },
                            ),
                          }, classesRequesterRecordReference);

                          await currentUserReference!
                              .update(createUsersRecordData(
                            userRefClassRequester:
                                _model.classRequesterUser?.reference,
                          ));

                          await _model.studentRefSelected!.reference.update({
                            ...mapToFirestore(
                              {
                                'studentAvailability':
                                    getAvailabilityListFirestoreData(
                                  FFAppState().availability,
                                ),
                              },
                            ),
                          });
                          FFAppState().clearRequesterListCache();
                          context.safePop();
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SnackBarWidget(
                                  titulo: 'Solicitação Criada!',
                                  mensagem:
                                      'Um administrador irá analisar sua solicitação e agendar seu aluno conforme os dados enviados.',
                                  button: () async {},
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Escolha o local da aula!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SnackBarWidget(
                                  titulo: 'Erro com a localização',
                                  mensagem:
                                      'verifique se foi selecionado uma localização e tente novamente.',
                                  button: () async {},
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'od3udtzg' /* Enviar Solicitação */,
                      ),
                      icon: const Icon(
                        Icons.schedule_send_outlined,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: const EdgeInsets.all(0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation']!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
