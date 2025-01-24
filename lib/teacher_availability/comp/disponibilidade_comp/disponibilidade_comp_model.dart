import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'disponibilidade_comp_widget.dart' show DisponibilidadeCompWidget;
import 'package:flutter/material.dart';

class DisponibilidadeCompModel
    extends FlutterFlowModel<DisponibilidadeCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Lingua widget.
  FormFieldController<List<String>>? linguaValueController;
  List<String>? get linguaValues => linguaValueController?.value;
  set linguaValues(List<String>? val) => linguaValueController?.value = val;
  // State field(s) for idademin widget.
  int? idademinValue;
  // State field(s) for idademax widget.
  int? idademaxValue;
  // State field(s) for Recado widget.
  FocusNode? recadoFocusNode;
  TextEditingController? recadoTextController;
  String? Function(BuildContext, String?)? recadoTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RequestAvailabilityRecord? requestAvailabilityOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClassesRecord? classesRefOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    recadoFocusNode?.dispose();
    recadoTextController?.dispose();
  }
}
