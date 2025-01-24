import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'horarios_student_widget.dart' show HorariosStudentWidget;
import 'package:flutter/material.dart';

class HorariosStudentModel extends FlutterFlowModel<HorariosStudentWidget> {
  ///  Local state fields for this component.

  DateTime? seg1;

  DateTime? seg2;

  DateTime? ter1;

  DateTime? ter2;

  DateTime? qua1;

  DateTime? qua2;

  DateTime? qui1;

  DateTime? qui2;

  DateTime? sex1;

  DateTime? sex2;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Day widget.
  FormFieldController<List<String>>? dayValueController;
  String? get dayValue => dayValueController?.value?.firstOrNull;
  set dayValue(String? val) =>
      dayValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
