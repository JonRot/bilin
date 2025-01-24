import '/flutter_flow/flutter_flow_util.dart';
import '/solicitacoes_pais/comp/user_sub_aluno/user_sub_aluno_widget.dart';
import 'user_list_student_widget.dart' show UserListStudentWidget;
import 'package:flutter/material.dart';

class UserListStudentModel extends FlutterFlowModel<UserListStudentWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for user_SubAluno dynamic component.
  late FlutterFlowDynamicModels<UserSubAlunoModel> userSubAlunoModels;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {
    userSubAlunoModels = FlutterFlowDynamicModels(() => UserSubAlunoModel());
  }

  @override
  void dispose() {
    userSubAlunoModels.dispose();
  }
}
