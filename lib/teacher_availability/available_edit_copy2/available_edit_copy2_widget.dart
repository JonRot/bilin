import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/teacher_availability/comp/horarios/horarios_widget.dart';
import 'package:flutter/material.dart';
import 'available_edit_copy2_model.dart';
export 'available_edit_copy2_model.dart';

class AvailableEditCopy2Widget extends StatefulWidget {
  const AvailableEditCopy2Widget({super.key});

  @override
  State<AvailableEditCopy2Widget> createState() =>
      _AvailableEditCopy2WidgetState();
}

class _AvailableEditCopy2WidgetState extends State<AvailableEditCopy2Widget> {
  late AvailableEditCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailableEditCopy2Model());
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: wrapWithModel(
        model: _model.horariosModel,
        updateCallback: () => safeSetState(() {}),
        child: const HorariosWidget(),
      ),
    );
  }
}
