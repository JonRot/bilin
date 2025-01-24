import '/flutter_flow/flutter_flow_util.dart';
import 'available_edit_admin_widget.dart' show AvailableEditAdminWidget;
import 'package:flutter/material.dart';

class AvailableEditAdminModel
    extends FlutterFlowModel<AvailableEditAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Recado widget.
  FocusNode? recadoFocusNode;
  TextEditingController? recadoTextController;
  String? Function(BuildContext, String?)? recadoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    recadoFocusNode?.dispose();
    recadoTextController?.dispose();
  }
}
