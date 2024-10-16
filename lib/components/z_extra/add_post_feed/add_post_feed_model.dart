import '/flutter_flow/flutter_flow_util.dart';
import 'add_post_feed_widget.dart' show AddPostFeedWidget;
import 'package:flutter/material.dart';

class AddPostFeedModel extends FlutterFlowModel<AddPostFeedWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
