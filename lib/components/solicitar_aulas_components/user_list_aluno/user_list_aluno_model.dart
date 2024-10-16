import '/components/solicitar_aulas_components/user_sub_aluno/user_sub_aluno_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_list_aluno_widget.dart' show UserListAlunoWidget;
import 'package:flutter/material.dart';

class UserListAlunoModel extends FlutterFlowModel<UserListAlunoWidget> {
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
