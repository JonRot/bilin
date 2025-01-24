import '/flutter_flow/flutter_flow_util.dart';
import '/registro_aulas_feedback/comp/registro_comp/registro_comp_widget.dart';
import 'registro_aulas_widget.dart' show RegistroAulasWidget;
import 'package:flutter/material.dart';

class RegistroAulasModel extends FlutterFlowModel<RegistroAulasWidget> {
  ///  Local state fields for this page.

  String? yes;

  String? no;

  String? cancel;

  ///  State fields for stateful widgets in this page.

  // Models for registroComp dynamic component.
  late FlutterFlowDynamicModels<RegistroCompModel> registroCompModels;

  @override
  void initState(BuildContext context) {
    registroCompModels = FlutterFlowDynamicModels(() => RegistroCompModel());
  }

  @override
  void dispose() {
    registroCompModels.dispose();
  }
}
