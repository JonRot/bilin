import '/components/chat_messages_components/chat_list_done/chat_list_done_widget.dart';
import '/components/dashboard/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_main_admin_widget.dart' show ChatMainAdminWidget;
import 'package:flutter/material.dart';

class ChatMainAdminModel extends FlutterFlowModel<ChatMainAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ChatListDone component.
  late ChatListDoneModel chatListDoneModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    chatListDoneModel = createModel(context, () => ChatListDoneModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    chatListDoneModel.dispose();
    navBarModel.dispose();
  }
}
