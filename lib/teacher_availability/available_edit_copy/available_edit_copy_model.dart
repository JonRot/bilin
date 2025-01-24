import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'available_edit_copy_widget.dart' show AvailableEditCopyWidget;
import 'package:flutter/material.dart';

class AvailableEditCopyModel extends FlutterFlowModel<AvailableEditCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for HorarioSeg widget.
  FormFieldController<List<String>>? horarioSegValueController;
  List<String>? get horarioSegValues => horarioSegValueController?.value;
  set horarioSegValues(List<String>? val) =>
      horarioSegValueController?.value = val;
  // State field(s) for HorarioTer widget.
  FormFieldController<List<String>>? horarioTerValueController;
  List<String>? get horarioTerValues => horarioTerValueController?.value;
  set horarioTerValues(List<String>? val) =>
      horarioTerValueController?.value = val;
  // State field(s) for HorarioQua widget.
  FormFieldController<List<String>>? horarioQuaValueController;
  List<String>? get horarioQuaValues => horarioQuaValueController?.value;
  set horarioQuaValues(List<String>? val) =>
      horarioQuaValueController?.value = val;
  // State field(s) for HorarioQui widget.
  FormFieldController<List<String>>? horarioQuiValueController;
  List<String>? get horarioQuiValues => horarioQuiValueController?.value;
  set horarioQuiValues(List<String>? val) =>
      horarioQuiValueController?.value = val;
  // State field(s) for HorarioSex widget.
  FormFieldController<List<String>>? horarioSexValueController;
  List<String>? get horarioSexValues => horarioSexValueController?.value;
  set horarioSexValues(List<String>? val) =>
      horarioSexValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
