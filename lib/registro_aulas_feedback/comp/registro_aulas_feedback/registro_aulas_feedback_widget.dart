import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'registro_aulas_feedback_model.dart';
export 'registro_aulas_feedback_model.dart';

class RegistroAulasFeedbackWidget extends StatefulWidget {
  const RegistroAulasFeedbackWidget({
    super.key,
    required this.bookRef,
    this.bookingFeedbackDoc,
    required this.dateTime,
    this.presence,
  });

  final DocumentReference? bookRef;
  final BookingFeedbackRecord? bookingFeedbackDoc;
  final DateTime? dateTime;
  final Attendance? presence;

  @override
  State<RegistroAulasFeedbackWidget> createState() =>
      _RegistroAulasFeedbackWidgetState();
}

class _RegistroAulasFeedbackWidgetState
    extends State<RegistroAulasFeedbackWidget> {
  late RegistroAulasFeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistroAulasFeedbackModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.yes = widget.presence == Attendance.Present;
      _model.no = widget.presence == Attendance.Absent;
      _model.cancel = widget.presence == Attendance.Excused;
      _model.currentState = widget.bookingFeedbackDoc?.bFeedAttendance;
      safeSetState(() {});
    });

    _model.textController ??=
        TextEditingController(text: widget.bookingFeedbackDoc?.bFeedFeedback);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: (_model.edit == true) ||
                (widget.bookingFeedbackDoc?.bFeedAttendance !=
                    _model.currentState) ||
                (widget.bookingFeedbackDoc?.reference == null)
            ? null
            : 60.0,
        constraints: const BoxConstraints(
          minHeight: 60.0,
          maxHeight: 260.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.edit = !_model.edit;
                    safeSetState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dateTimeFormat(
                          "d \'de\' MMM",
                          widget.dateTime,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        textAlign: TextAlign.end,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.yes == true)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 2.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderRadius: 8.0,
                                buttonSize: 35.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondary,
                                icon: Icon(
                                  Icons.check,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  _model.no = false;
                                  _model.cancel = false;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.yes == false)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 2.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderRadius: 8.0,
                                borderWidth: 2.0,
                                buttonSize: 35.0,
                                icon: Icon(
                                  Icons.check,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  _model.no = false;
                                  _model.yes = true;
                                  _model.cancel = false;
                                  _model.currentState = Attendance.Present;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.no == true)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 2.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context).error,
                                borderRadius: 8.0,
                                buttonSize: 35.0,
                                fillColor: FlutterFlowTheme.of(context).error,
                                icon: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  _model.cancel = false;
                                  _model.yes = false;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.no == false)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 2.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context).error,
                                borderRadius: 8.0,
                                borderWidth: 2.0,
                                buttonSize: 35.0,
                                icon: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  _model.no = true;
                                  _model.yes = false;
                                  _model.cancel = false;
                                  _model.currentState = Attendance.Absent;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.cancel == true)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 2.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: 8.0,
                                buttonSize: 35.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                icon: Icon(
                                  Icons.free_cancellation_outlined,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  _model.no = false;
                                  _model.yes = false;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.cancel == false)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 2.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: 8.0,
                                borderWidth: 2.0,
                                buttonSize: 35.0,
                                icon: Icon(
                                  Icons.free_cancellation_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  _model.cancel = true;
                                  _model.no = false;
                                  _model.yes = false;
                                  _model.currentState = Attendance.Excused;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 2.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'scvmfio4' /* Feedback */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'o6m6g47k' /* Escreva um feedback */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
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
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 14,
                            minLines: 1,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 35.0,
                      fillColor: FlutterFlowTheme.of(context).secondary,
                      icon: Icon(
                        Icons.photo_library,
                        color: FlutterFlowTheme.of(context).info,
                        size: 18.0,
                      ),
                      onPressed: () async {
                        final selectedMedia = await selectMedia(
                          maxWidth: 400.00,
                          maxHeight: 400.00,
                          imageQuality: 100,
                          mediaSource: MediaSource.photoGallery,
                          multiImage: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFiles = selectedUploadedFiles;
                              _model.uploadedFileUrls = downloadUrls;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }
                        }
                      },
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  if (widget.bookingFeedbackDoc?.reference != null) {
                    await widget.bookingFeedbackDoc!.reference
                        .update(createBookingFeedbackRecordData(
                      bFeedFeedback: _model.textController.text,
                      bFeedAttendance: () {
                        if (_model.yes == true) {
                          return Attendance.Present;
                        } else if (_model.no == true) {
                          return Attendance.Absent;
                        } else {
                          return Attendance.Excused;
                        }
                      }(),
                    ));
                  } else {
                    await BookingFeedbackRecord.createDoc(widget.bookRef!)
                        .set({
                      ...createBookingFeedbackRecordData(
                        bFeedDateTime: widget.dateTime,
                        bFeedFeedback: _model.textController.text,
                        bFeedAttendance: () {
                          if (_model.yes == true) {
                            return Attendance.Present;
                          } else if (_model.no == true) {
                            return Attendance.Absent;
                          } else {
                            return Attendance.Excused;
                          }
                        }(),
                        bFeedDayTime:
                            '${functions.dateTimeToSimplifyDayString(widget.dateTime)} - ${dateTimeFormat(
                          "Hm",
                          widget.dateTime,
                          locale: FFLocalizations.of(context).languageCode,
                        )}',
                      ),
                      ...mapToFirestore(
                        {
                          'bFeedImages': _model.uploadedFileUrls,
                        },
                      ),
                    });
                  }

                  _model.update = !_model.update;
                  safeSetState(() {});
                  await Future.wait([
                    Future(() async {
                      FFAppState().clearPresentNumCache();
                    }),
                    Future(() async {
                      FFAppState().clearAbsentNumCache();
                    }),
                    Future(() async {
                      FFAppState().clearExcludedNumCache();
                    }),
                  ]);
                },
                text: widget.bookingFeedbackDoc?.reference != null
                    ? 'Atualizar'
                    : 'Registrar',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ].divide(const SizedBox(height: 2.0)),
          ),
        ),
      ),
    );
  }
}
