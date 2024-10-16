import '/components/solicitar_aulas_components/user_sub_teacher/user_sub_teacher_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_list_teacher_widget.dart' show UserListTeacherWidget;
import 'package:flutter/material.dart';

class UserListTeacherModel extends FlutterFlowModel<UserListTeacherWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for user_SubTeacher dynamic component.
  late FlutterFlowDynamicModels<UserSubTeacherModel> userSubTeacherModels;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {
    userSubTeacherModels =
        FlutterFlowDynamicModels(() => UserSubTeacherModel());
  }

  @override
  void dispose() {
    userSubTeacherModels.dispose();
  }
}
