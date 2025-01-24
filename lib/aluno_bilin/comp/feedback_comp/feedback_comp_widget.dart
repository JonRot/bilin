import '/aluno_bilin/comp/image_viewr/image_viewr_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'feedback_comp_model.dart';
export 'feedback_comp_model.dart';

class FeedbackCompWidget extends StatefulWidget {
  const FeedbackCompWidget({
    super.key,
    required this.time,
    bool? imageBool,
    this.attendance,
    this.feedback,
    this.bookingFeddDoc,
  }) : imageBool = imageBool ?? false;

  final String? time;
  final bool imageBool;
  final Attendance? attendance;
  final String? feedback;
  final BookingFeedbackRecord? bookingFeddDoc;

  @override
  State<FeedbackCompWidget> createState() => _FeedbackCompWidgetState();
}

class _FeedbackCompWidgetState extends State<FeedbackCompWidget> {
  late FeedbackCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 750),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: (_model.smallBig == true) &&
                  (_model.dateRef == widget.bookingFeddDoc?.bFeedDateTime)
              ? null
              : 45.0,
          constraints: const BoxConstraints(
            minHeight: 45.0,
            maxHeight: 500.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: Text(
                        widget.time!,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (((widget.bookingFeddDoc?.bFeedFeedback != null &&
                                    widget.bookingFeddDoc?.bFeedFeedback !=
                                        '') ||
                                (widget
                                    .bookingFeddDoc!.bFeedImages.isNotEmpty)) &&
                            (_model.smallBig == false))
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 30.0,
                            fillColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              Icons.feedback_outlined,
                              color: FlutterFlowTheme.of(context).info,
                              size: 14.0,
                            ),
                            onPressed: () async {
                              _model.dateRef =
                                  widget.bookingFeddDoc?.bFeedDateTime;
                              _model.smallBig = true;
                              safeSetState(() {});
                            },
                          ),
                        if (((widget.bookingFeddDoc?.bFeedFeedback != null &&
                                    widget.bookingFeddDoc?.bFeedFeedback !=
                                        '') ||
                                (widget
                                    .bookingFeddDoc!.bFeedImages.isNotEmpty)) &&
                            (_model.smallBig == true))
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 8.0,
                            borderWidth: 2.0,
                            buttonSize: 30.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: Icon(
                              Icons.feedback,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 14.0,
                            ),
                            onPressed: () async {
                              _model.smallBig = false;
                              _model.hight = 45.0;
                              safeSetState(() {});
                            },
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget.attendance == Attendance.Present)
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 2.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 18.0,
                                ),
                              ),
                            if (widget.attendance == Attendance.Absent)
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 18.0,
                                ),
                              ),
                            if (widget.attendance == Attendance.Excused)
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 2.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.free_cancellation_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                              ),
                          ],
                        ),
                      ].divide(const SizedBox(width: 4.0)),
                    ),
                  ].divide(const SizedBox(width: 4.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/C_T.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '4gseyv9o' /* Feedback: */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      widget.feedback!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.bookingFeddDoc?.bFeedImages != null &&
                                  (widget.bookingFeddDoc?.bFeedImages)!
                                      .isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 12.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 30.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    icon: Icon(
                                      Icons.photo_library,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 14.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.5,
                                              child: ImageViewrWidget(
                                                feedbackDoc:
                                                    widget.bookingFeddDoc!,
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
                  ].divide(const SizedBox(width: 12.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
