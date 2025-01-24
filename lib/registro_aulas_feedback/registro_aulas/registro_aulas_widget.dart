import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/registro_aulas_feedback/comp/registro_comp/registro_comp_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'registro_aulas_model.dart';
export 'registro_aulas_model.dart';

class RegistroAulasWidget extends StatefulWidget {
  const RegistroAulasWidget({
    super.key,
    required this.bookingDocList,
  });

  final List<BookingsRecord>? bookingDocList;

  @override
  State<RegistroAulasWidget> createState() => _RegistroAulasWidgetState();
}

class _RegistroAulasWidgetState extends State<RegistroAulasWidget> {
  late RegistroAulasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistroAulasModel());
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '4sgb55k6' /* Registro */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Plus Jakarta Sans',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Builder(
              builder: (context) {
                final bookreg = widget.bookingDocList!
                    .sortedList(keyOf: (e) => e.bookingTime!, desc: false)
                    .toList();

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: bookreg.length,
                  itemBuilder: (context, bookregIndex) {
                    final bookregItem = bookreg[bookregIndex];
                    return FutureBuilder<int>(
                      future: FFAppState().presentNum(
                        requestFn: () => queryBookingFeedbackRecordCount(
                          parent: bookregItem.reference,
                          queryBuilder: (bookingFeedbackRecord) =>
                              bookingFeedbackRecord
                                  .where(
                                    'bFeedAttendance',
                                    isEqualTo: Attendance.Present.serialize(),
                                  )
                                  .where(
                                    'bFeedDayTime',
                                    isEqualTo:
                                        '${functions.simplifyDayString(bookregItem.bookingDayOfWeek)} - ${dateTimeFormat(
                                      "Hm",
                                      bookregItem.bookingTime,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                  ),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 10.0,
                              height: 10.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                            ),
                          );
                        }
                        int presentCount = snapshot.data!;

                        return Container(
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<int>(
                            future: FFAppState().absentNum(
                              requestFn: () => queryBookingFeedbackRecordCount(
                                parent: bookregItem.reference,
                                queryBuilder: (bookingFeedbackRecord) =>
                                    bookingFeedbackRecord
                                        .where(
                                          'bFeedAttendance',
                                          isEqualTo:
                                              Attendance.Absent.serialize(),
                                        )
                                        .where(
                                          'bFeedDayTime',
                                          isEqualTo:
                                              '${functions.simplifyDayString(bookregItem.bookingDayOfWeek)} - ${dateTimeFormat(
                                            "Hm",
                                            bookregItem.bookingTime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}',
                                        ),
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 10.0,
                                    height: 10.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).error,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              int absentCount = snapshot.data!;

                              return Container(
                                decoration: const BoxDecoration(),
                                child: FutureBuilder<int>(
                                  future: FFAppState().excludedNum(
                                    requestFn: () =>
                                        queryBookingFeedbackRecordCount(
                                      parent: bookregItem.reference,
                                      queryBuilder: (bookingFeedbackRecord) =>
                                          bookingFeedbackRecord
                                              .where(
                                                'bFeedAttendance',
                                                isEqualTo: Attendance.Excused
                                                    .serialize(),
                                              )
                                              .where(
                                                'bFeedDayTime',
                                                isEqualTo:
                                                    '${functions.simplifyDayString(bookregItem.bookingDayOfWeek)} - ${dateTimeFormat(
                                                  "Hm",
                                                  bookregItem.bookingTime,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}',
                                              ),
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 10.0,
                                          height: 10.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    int excludedCount = snapshot.data!;

                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: StreamBuilder<StudentRecord>(
                                          stream: StudentRecord.getDocument(
                                              bookregItem.bookingStudentRef!),
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

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'RegistroAulasDetails',
                                                  queryParameters: {
                                                    'bookingDoc':
                                                        serializeParam(
                                                      bookregItem,
                                                      ParamType.Document,
                                                    ),
                                                    'studentDoc':
                                                        serializeParam(
                                                      containerStudentRecord,
                                                      ParamType.Document,
                                                    ),
                                                    'presentNum':
                                                        serializeParam(
                                                      presentCount,
                                                      ParamType.int,
                                                    ),
                                                    'absentNum': serializeParam(
                                                      absentCount,
                                                      ParamType.int,
                                                    ),
                                                    'exclusionNum':
                                                        serializeParam(
                                                      excludedCount,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'bookingDoc': bookregItem,
                                                    'studentDoc':
                                                        containerStudentRecord,
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width: 160.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .registroCompModels
                                                              .getModel(
                                                            bookregItem
                                                                .reference.id,
                                                            bookregIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              RegistroCompWidget(
                                                            key: Key(
                                                              'Keycuk_${bookregItem.reference.id}',
                                                            ),
                                                            image:
                                                                containerStudentRecord
                                                                    .studentPhoto,
                                                            name:
                                                                '${containerStudentRecord.studentName} ${containerStudentRecord.studentLastName}',
                                                            hoz: true,
                                                            dayTime:
                                                                '${functions.simplifyDayString(bookregItem.bookingDayOfWeek)} - ${dateTimeFormat(
                                                              "Hm",
                                                              bookregItem
                                                                  .bookingTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            bookingDocRef:
                                                                bookregItem
                                                                    .reference,
                                                            presentNum:
                                                                presentCount,
                                                            absentNum:
                                                                absentCount,
                                                            excludedNum:
                                                                excludedCount,
                                                          ),
                                                        ),
                                                      ),
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      8.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_right,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
