import '/flutter_flow/flutter_flow_util.dart';
import '/messages/comp/chat_list_done/chat_list_done_widget.dart';
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
  late ChatListDoneModel chatListDoneModel1;
  // Model for ChatListDone component.
  late ChatListDoneModel chatListDoneModel2;

  @override
  void initState(BuildContext context) {
    chatListDoneModel1 = createModel(context, () => ChatListDoneModel());
    chatListDoneModel2 = createModel(context, () => ChatListDoneModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    chatListDoneModel1.dispose();
    chatListDoneModel2.dispose();
  }
}
