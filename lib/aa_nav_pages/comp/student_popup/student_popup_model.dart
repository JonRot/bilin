import '/aluno_bilin/comp/aluno_bilin_main/aluno_bilin_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'student_popup_widget.dart' show StudentPopupWidget;
import 'package:flutter/material.dart';

class StudentPopupModel extends FlutterFlowModel<StudentPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AlunoBilinMain component.
  late AlunoBilinMainModel alunoBilinMainModel;

  @override
  void initState(BuildContext context) {
    alunoBilinMainModel = createModel(context, () => AlunoBilinMainModel());
  }

  @override
  void dispose() {
    alunoBilinMainModel.dispose();
  }
}
