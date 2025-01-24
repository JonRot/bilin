import '/aluno_bilin/comp/aluno_bilin_main/aluno_bilin_main_widget.dart';
import '/aluno_bilin/comp/feedback_comp/feedback_comp_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'perfil_aluno_bilin_model.dart';
export 'perfil_aluno_bilin_model.dart';

class PerfilAlunoBilinWidget extends StatefulWidget {
  const PerfilAlunoBilinWidget({
    super.key,
    required this.studentParaDocument,
    this.bookingDoc,
  });

  final StudentRecord? studentParaDocument;
  final BookingsRecord? bookingDoc;

  @override
  State<PerfilAlunoBilinWidget> createState() => _PerfilAlunoBilinWidgetState();
}

class _PerfilAlunoBilinWidgetState extends State<PerfilAlunoBilinWidget> {
  late PerfilAlunoBilinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilAlunoBilinModel());
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
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
        title: Text(
          FFLocalizations.of(context).getText(
            'vkspql8w' /* Perfil do Aluno */,
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
      body: StreamBuilder<List<BookingFeedbackRecord>>(
        stream: queryBookingFeedbackRecord(
          parent: widget.bookingDoc?.reference,
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
          List<BookingFeedbackRecord> containerBookingFeedbackRecordList =
              snapshot.data!;

          return Container(
            decoration: const BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.alunoBilinMainModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AlunoBilinMainWidget(
                                nextTime: functions.nextScheduleTime(
                                    containerBookingFeedbackRecordList
                                        .sortedList(
                                            keyOf: (e) => e.bFeedDateTime!,
                                            desc: true)
                                        .firstOrNull
                                        ?.bFeedDateTime)!,
                                studentLocation: valueOrDefault(
                                    currentUserDocument?.userDefaultLocation,
                                    ''),
                                studentDoc: widget.studentParaDocument!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (containerBookingFeedbackRecordList
                          .where((e) => widget
                              .studentParaDocument!.studentBookingRef
                              .contains(e.parentReference))
                          .toList()
                          .sortedList(
                              keyOf: (e) => e.bFeedDateTime!, desc: true).isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '4wcno2ez' /* Aulas Pasadas */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'jd0gvsle' /* Presença */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
                    child: Builder(
                      builder: (context) {
                        final bookingList = containerBookingFeedbackRecordList
                            .where((e) => widget
                                .studentParaDocument!.studentBookingRef
                                .contains(e.parentReference))
                            .toList()
                            .sortedList(
                                keyOf: (e) => e.bFeedDateTime!, desc: true)
                            .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: bookingList.length,
                          itemBuilder: (context, bookingListIndex) {
                            final bookingListItem =
                                bookingList[bookingListIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (valueOrDefault<String>(
                                      functions.organizeListDateTimeByMonth(
                                          containerBookingFeedbackRecordList
                                              .where((e) => widget
                                                  .studentParaDocument!
                                                  .studentBookingRef
                                                  .contains(e.parentReference))
                                              .toList()
                                              .map((e) => e.bFeedDateTime)
                                              .withoutNulls
                                              .toList(),
                                          bookingListItem.bFeedDateTime),
                                      'null',
                                    ) !=
                                    'null')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.organizeListDateTimeByMonth(
                                            containerBookingFeedbackRecordList
                                                .where((e) => widget
                                                    .studentParaDocument!
                                                    .studentBookingRef
                                                    .contains(
                                                        e.parentReference))
                                                .toList()
                                                .map((e) => e.bFeedDateTime)
                                                .withoutNulls
                                                .toList(),
                                            bookingListItem.bFeedDateTime),
                                        'null',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                wrapWithModel(
                                  model: _model.feedbackCompModels.getModel(
                                    bookingListItem.reference.id,
                                    bookingListIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: Hero(
                                    tag: 'feedback',
                                    transitionOnUserGestures: true,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: FeedbackCompWidget(
                                        key: Key(
                                          'Keyxe6_${bookingListItem.reference.id}',
                                        ),
                                        time: dateTimeFormat(
                                          "HH:mm \' - \' d \'de\' MMM",
                                          bookingListItem.bFeedDateTime!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        imageBool: _model.showHide,
                                        attendance:
                                            bookingListItem.bFeedAttendance,
                                        feedback: valueOrDefault<String>(
                                          bookingListItem.bFeedFeedback,
                                          'Testing a long textTesting a long textTesting a long textTesting a long text',
                                        ),
                                        bookingFeddDoc: bookingListItem,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
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
