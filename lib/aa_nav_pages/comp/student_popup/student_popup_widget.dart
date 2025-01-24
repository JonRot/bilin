import '/aluno_bilin/comp/aluno_bilin_main/aluno_bilin_main_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'student_popup_model.dart';
export 'student_popup_model.dart';

class StudentPopupWidget extends StatefulWidget {
  const StudentPopupWidget({
    super.key,
    this.studentLocation,
    this.nextTime,
    String? dayOfWeek,
    required this.studentDoc,
  }) : dayOfWeek = dayOfWeek ?? 'nextDay';

  final String? studentLocation;
  final DateTime? nextTime;
  final String dayOfWeek;
  final StudentRecord? studentDoc;

  @override
  State<StudentPopupWidget> createState() => _StudentPopupWidgetState();
}

class _StudentPopupWidgetState extends State<StudentPopupWidget> {
  late StudentPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentPopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            wrapWithModel(
              model: _model.alunoBilinMainModel,
              updateCallback: () => safeSetState(() {}),
              child: AlunoBilinMainWidget(
                nextTime: widget.nextTime!,
                studentLocation: widget.studentLocation,
                studentDoc: widget.studentDoc!,
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                'b6jiwyxy' /* Fechar */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
          ],
        ),
      ),
    );
  }
}
