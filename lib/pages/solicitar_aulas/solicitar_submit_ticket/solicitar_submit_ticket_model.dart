import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/solicitar_aulas_components/user_sub_aluno/user_sub_aluno_widget.dart';
import '/components/solicitar_aulas_components/user_sub_atendimento/user_sub_atendimento_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'solicitar_submit_ticket_widget.dart' show SolicitarSubmitTicketWidget;
import 'package:flutter/material.dart';

class SolicitarSubmitTicketModel
    extends FlutterFlowModel<SolicitarSubmitTicketWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for user_SubAtendimento component.
  late UserSubAtendimentoModel userSubAtendimentoModel;
  // Stores action output result for [Bottom Sheet - user_ListAluno] action in Container widget.
  AlunoRecord? userRefSelected;
  // Model for user_SubAluno component.
  late UserSubAlunoModel userSubAlunoModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  // Stores action output result for [Backend Call - API (apiBuscarCep)] action in IconButton widget.
  ApiCallResponse? apiResultxx9;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    userSubAtendimentoModel =
        createModel(context, () => UserSubAtendimentoModel());
    userSubAlunoModel = createModel(context, () => UserSubAlunoModel());
  }

  @override
  void dispose() {
    userSubAtendimentoModel.dispose();
    userSubAlunoModel.dispose();
    cepFocusNode?.dispose();
    cepTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
