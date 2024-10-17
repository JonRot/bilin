import '/backend/backend.dart';
import '/components/solicitar_aulas_components/user_sub_aluno/user_sub_aluno_widget.dart';
import '/components/solicitar_aulas_components/user_sub_teacher/user_sub_teacher_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'agendamento_widget.dart' show AgendamentoWidget;
import 'package:flutter/material.dart';

class AgendamentoModel extends FlutterFlowModel<AgendamentoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for user_SubAluno component.
  late UserSubAlunoModel userSubAlunoModel;
  // Stores action output result for [Bottom Sheet - user_ListTeacher] action in Container widget.
  UsersRecord? userRefSelected1;
  // Model for user_SubTeacher component.
  late UserSubTeacherModel userSubTeacherModel;
  // State field(s) for week2x widget.
  bool? week2xValue;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for tempoManha widget.
  FormFieldController<List<String>>? tempoManhaValueController1;
  String? get tempoManhaValue1 =>
      tempoManhaValueController1?.value?.firstOrNull;
  set tempoManhaValue1(String? val) =>
      tempoManhaValueController1?.value = val != null ? [val] : [];
  // State field(s) for tempoManha widget.
  FormFieldController<List<String>>? tempoManhaValueController2;
  String? get tempoManhaValue2 =>
      tempoManhaValueController2?.value?.firstOrNull;
  set tempoManhaValue2(String? val) =>
      tempoManhaValueController2?.value = val != null ? [val] : [];
  // State field(s) for problemDescription widget.
  FocusNode? problemDescriptionFocusNode;
  TextEditingController? problemDescriptionTextController;
  String? Function(BuildContext, String?)?
      problemDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {
    userSubAlunoModel = createModel(context, () => UserSubAlunoModel());
    userSubTeacherModel = createModel(context, () => UserSubTeacherModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    userSubAlunoModel.dispose();
    userSubTeacherModel.dispose();
    problemDescriptionFocusNode?.dispose();
    problemDescriptionTextController?.dispose();
  }
}
