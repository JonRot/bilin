import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'registro_aulas_feedback_widget.dart' show RegistroAulasFeedbackWidget;
import 'package:flutter/material.dart';

class RegistroAulasFeedbackModel
    extends FlutterFlowModel<RegistroAulasFeedbackWidget> {
  ///  Local state fields for this component.

  bool yes = false;

  bool no = false;

  bool cancel = false;

  bool update = false;

  Attendance? currentState;

  bool edit = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
