import '/aa_nav_pages/comp/horarios_student/horarios_student_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/localizacao/comp/locatio_one/locatio_one_widget.dart';
import '/solicitacoes_pais/comp/user_sub_aluno/user_sub_aluno_widget.dart';
import 'agendarmento_pais_widget.dart' show AgendarmentoPaisWidget;
import 'package:flutter/material.dart';

class AgendarmentoPaisModel extends FlutterFlowModel<AgendarmentoPaisWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Lingua widget.
  FormFieldController<List<String>>? linguaValueController;
  List<String>? get linguaValues => linguaValueController?.value;
  set linguaValues(List<String>? val) => linguaValueController?.value = val;
  // Stores action output result for [Bottom Sheet - user_ListStudent] action in Container widget.
  StudentRecord? studentRefSelected;
  // Model for user_SubAluno component.
  late UserSubAlunoModel userSubAlunoModel;
  // Model for HorariosStudent component.
  late HorariosStudentModel horariosStudentModel;
  // Stores action output result for [Bottom Sheet - local] action in Container widget.
  CidadeRecord? cidadeSelectedStudent;
  // Model for locatioOne component.
  late LocatioOneModel locatioOneModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClassesRequesterRecord? classRequesterUser;

  @override
  void initState(BuildContext context) {
    userSubAlunoModel = createModel(context, () => UserSubAlunoModel());
    horariosStudentModel = createModel(context, () => HorariosStudentModel());
    locatioOneModel = createModel(context, () => LocatioOneModel());
  }

  @override
  void dispose() {
    userSubAlunoModel.dispose();
    horariosStudentModel.dispose();
    locatioOneModel.dispose();
  }
}
