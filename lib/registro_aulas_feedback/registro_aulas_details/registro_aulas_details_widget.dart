import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/registro_aulas_feedback/comp/registro_aulas_feedback/registro_aulas_feedback_widget.dart';
import '/registro_aulas_feedback/comp/registro_comp/registro_comp_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'registro_aulas_details_model.dart';
export 'registro_aulas_details_model.dart';

class RegistroAulasDetailsWidget extends StatefulWidget {
  const RegistroAulasDetailsWidget({
    super.key,
    required this.bookingDoc,
    required this.studentDoc,
    required this.presentNum,
    required this.absentNum,
    required this.exclusionNum,
  });

  final BookingsRecord? bookingDoc;
  final StudentRecord? studentDoc;
  final int? presentNum;
  final int? absentNum;
  final int? exclusionNum;

  @override
  State<RegistroAulasDetailsWidget> createState() =>
      _RegistroAulasDetailsWidgetState();
}

class _RegistroAulasDetailsWidgetState extends State<RegistroAulasDetailsWidget>
    with TickerProviderStateMixin {
  late RegistroAulasDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistroAulasDetailsModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
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
                        '9psntnq2' /* Registro */,
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
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.registroCompModel,
                            updateCallback: () => safeSetState(() {}),
                            child: RegistroCompWidget(
                              image: widget.studentDoc?.studentPhoto,
                              name:
                                  '${widget.studentDoc?.studentName} ${widget.studentDoc?.studentLastName}',
                              hoz: false,
                              dayTime:
                                  '${functions.simplifyDayString(widget.bookingDoc?.bookingDayOfWeek)} - ${dateTimeFormat(
                                "Hm",
                                widget.bookingDoc?.bookingTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}',
                              bookingDocRef: widget.bookingDoc!.reference,
                              presentNum: widget.presentNum!,
                              absentNum: widget.absentNum!,
                              excludedNum: widget.exclusionNum!,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '5hxf166y' /* Aulas pasadas: */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Builder(
                              builder: (context) {
                                final bookedRegitrations = functions
                                        .dateTimeRegistrationDates(
                                            widget.bookingDoc
                                                ?.bookingCreatedDateTime,
                                            widget
                                                .bookingDoc?.bookingDayOfWeek,
                                            widget.bookingDoc?.bookingTime,
                                            widget.bookingDoc
                                                ?.bookingExceptionDays
                                                .toList())
                                        ?.sortedList(
                                            keyOf: (e) => e, desc: true)
                                        .toList() ??
                                    [];

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: bookedRegitrations.length,
                                  itemBuilder:
                                      (context, bookedRegitrationsIndex) {
                                    final bookedRegitrationsItem =
                                        bookedRegitrations[
                                            bookedRegitrationsIndex];
                                    return FutureBuilder<
                                        List<BookingFeedbackRecord>>(
                                      future: queryBookingFeedbackRecordOnce(
                                        parent: widget.bookingDoc?.reference,
                                        queryBuilder: (bookingFeedbackRecord) =>
                                            bookingFeedbackRecord.where(
                                          'bFeedDateTime',
                                          isEqualTo: bookedRegitrationsItem,
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0x6C57636C),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<BookingFeedbackRecord>
                                            registroAulasFeedbackBookingFeedbackRecordList =
                                            snapshot.data!;
                                        final registroAulasFeedbackBookingFeedbackRecord =
                                            registroAulasFeedbackBookingFeedbackRecordList
                                                    .isNotEmpty
                                                ? registroAulasFeedbackBookingFeedbackRecordList
                                                    .first
                                                : null;

                                        return wrapWithModel(
                                          model: _model
                                              .registroAulasFeedbackModels
                                              .getModel(
                                            bookedRegitrationsItem.toString(),
                                            bookedRegitrationsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: Hero(
                                            tag: 'registroDetails2',
                                            transitionOnUserGestures: true,
                                            child: Material(
                                              color: Colors.transparent,
                                              child:
                                                  RegistroAulasFeedbackWidget(
                                                key: Key(
                                                  'Keyine_${bookedRegitrationsItem.toString()}',
                                                ),
                                                bookRef: widget
                                                    .bookingDoc!.reference,
                                                bookingFeedbackDoc:
                                                    registroAulasFeedbackBookingFeedbackRecord,
                                                dateTime:
                                                    bookedRegitrationsItem,
                                                presence:
                                                    registroAulasFeedbackBookingFeedbackRecord
                                                        ?.bFeedAttendance,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'listViewOnPageLoadAnimation']!);
                              },
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
    );
  }
}
