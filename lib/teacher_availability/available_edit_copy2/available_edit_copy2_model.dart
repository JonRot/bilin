import '/flutter_flow/flutter_flow_util.dart';
import '/teacher_availability/comp/horarios/horarios_widget.dart';
import 'available_edit_copy2_widget.dart' show AvailableEditCopy2Widget;
import 'package:flutter/material.dart';

class AvailableEditCopy2Model
    extends FlutterFlowModel<AvailableEditCopy2Widget> {
  ///  Local state fields for this page.

  DateTime? s1;

  DateTime? s2;

  DateTime? t1;

  DateTime? t2;

  DateTime? qua1;

  DateTime? qua2;

  DateTime? qui1;

  DateTime? qui2;

  DateTime? sex1;

  DateTime? sex2;

  ///  State fields for stateful widgets in this page.

  // Model for Horarios component.
  late HorariosModel horariosModel;

  @override
  void initState(BuildContext context) {
    horariosModel = createModel(context, () => HorariosModel());
  }

  @override
  void dispose() {
    horariosModel.dispose();
  }
}
