import '/aluno_bilin/comp/aluno_bilin_main/aluno_bilin_main_widget.dart';
import '/aluno_bilin/comp/feedback_comp/feedback_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_aluno_bilin_widget.dart' show PerfilAlunoBilinWidget;
import 'package:flutter/material.dart';

class PerfilAlunoBilinModel extends FlutterFlowModel<PerfilAlunoBilinWidget> {
  ///  Local state fields for this page.

  bool showHide = false;

  DateTime? refDateTiem;

  int? hight = 45;

  ///  State fields for stateful widgets in this page.

  // Model for AlunoBilinMain component.
  late AlunoBilinMainModel alunoBilinMainModel;
  // Models for FeedbackComp dynamic component.
  late FlutterFlowDynamicModels<FeedbackCompModel> feedbackCompModels;

  @override
  void initState(BuildContext context) {
    alunoBilinMainModel = createModel(context, () => AlunoBilinMainModel());
    feedbackCompModels = FlutterFlowDynamicModels(() => FeedbackCompModel());
  }

  @override
  void dispose() {
    alunoBilinMainModel.dispose();
    feedbackCompModels.dispose();
  }
}
