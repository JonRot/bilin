import '/components/chat_messages_components/chat_list_done/chat_list_done_widget.dart';
import '/components/dashboard/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_main_widget.dart' show ChatMainWidget;
import 'package:flutter/material.dart';

class ChatMainModel extends FlutterFlowModel<ChatMainWidget> {
  ///  State fields for stateful widgets in this page.

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
    chatListDoneModel.dispose();
    navBarModel.dispose();
  }
}
