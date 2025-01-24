import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/localizacao/comp/locatio_one/locatio_one_widget.dart';
import 'available_edit_widget.dart' show AvailableEditWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AvailableEditModel extends FlutterFlowModel<AvailableEditWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in AvailableEdit widget.
  ClassesRecord? classesQ;
  // State field(s) for Recado widget.
  FocusNode? recadoFocusNode;
  TextEditingController? recadoTextController;
  String? Function(BuildContext, String?)? recadoTextControllerValidator;
  // State field(s) for Day widget.
  FormFieldController<List<String>>? dayValueController;
  String? get dayValue => dayValueController?.value?.firstOrNull;
  set dayValue(String? val) =>
      dayValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Bottom Sheet - local] action in Container widget.
  CidadeRecord? cidadeSelected1;
  // Model for locatioOne component.
  late LocatioOneModel locatioOneModel1;
  // Stores action output result for [Bottom Sheet - local] action in Container widget.
  CidadeRecord? cidadeSelected2;
  // Model for locatioOne component.
  late LocatioOneModel locatioOneModel2;
  // Stores action output result for [Bottom Sheet - local] action in Container widget.
  CidadeRecord? cidadeSelected3;
  // Model for locatioOne component.
  late LocatioOneModel locatioOneModel3;
  // Stores action output result for [Bottom Sheet - local] action in Container widget.
  CidadeRecord? cidadeSelected4;
  // Model for locatioOne component.
  late LocatioOneModel locatioOneModel4;
  // Stores action output result for [Bottom Sheet - local] action in Container widget.
  CidadeRecord? cidadeSelected5;
  // Model for locatioOne component.
  late LocatioOneModel locatioOneModel5;

  @override
  void initState(BuildContext context) {
    locatioOneModel1 = createModel(context, () => LocatioOneModel());
    locatioOneModel2 = createModel(context, () => LocatioOneModel());
    locatioOneModel3 = createModel(context, () => LocatioOneModel());
    locatioOneModel4 = createModel(context, () => LocatioOneModel());
    locatioOneModel5 = createModel(context, () => LocatioOneModel());
  }

  @override
  void dispose() {
    recadoFocusNode?.dispose();
    recadoTextController?.dispose();

    locatioOneModel1.dispose();
    locatioOneModel2.dispose();
    locatioOneModel3.dispose();
    locatioOneModel4.dispose();
    locatioOneModel5.dispose();
  }
}
