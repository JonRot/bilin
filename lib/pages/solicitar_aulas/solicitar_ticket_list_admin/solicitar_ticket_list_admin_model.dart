import '/flutter_flow/flutter_flow_util.dart';
import 'solicitar_ticket_list_admin_widget.dart'
    show SolicitarTicketListAdminWidget;
import 'package:flutter/material.dart';

class SolicitarTicketListAdminModel
    extends FlutterFlowModel<SolicitarTicketListAdminWidget> {
  ///  State fields for stateful widgets in this page.

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
