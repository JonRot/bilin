import '/flutter_flow/flutter_flow_util.dart';
import '/registro_aulas_feedback/comp/registro_aulas_feedback/registro_aulas_feedback_widget.dart';
import '/registro_aulas_feedback/comp/registro_comp/registro_comp_widget.dart';
import 'registro_aulas_details_widget.dart' show RegistroAulasDetailsWidget;
import 'package:flutter/material.dart';

class RegistroAulasDetailsModel
    extends FlutterFlowModel<RegistroAulasDetailsWidget> {
  ///  Local state fields for this page.

  String? yes;

  String? no;

  String? cancel;

  bool? hightAdjust = false;

  ///  State fields for stateful widgets in this page.

  // Model for registroComp component.
  late RegistroCompModel registroCompModel;
  // Models for RegistroAulasFeedback dynamic component.
  late FlutterFlowDynamicModels<RegistroAulasFeedbackModel>
      registroAulasFeedbackModels;

  @override
  void initState(BuildContext context) {
    registroCompModel = createModel(context, () => RegistroCompModel());
    registroAulasFeedbackModels =
        FlutterFlowDynamicModels(() => RegistroAulasFeedbackModel());
  }

  @override
  void dispose() {
    registroCompModel.dispose();
    registroAulasFeedbackModels.dispose();
  }
}
