import '/flutter_flow/flutter_flow_util.dart';
import 'request_parents_widget.dart' show RequestParentsWidget;
import 'package:flutter/material.dart';

class RequestParentsModel extends FlutterFlowModel<RequestParentsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
