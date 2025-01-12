import '/components/dashboard/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'minha_agenda_admin_widget.dart' show MinhaAgendaAdminWidget;
import 'package:flutter/material.dart';

class MinhaAgendaAdminModel extends FlutterFlowModel<MinhaAgendaAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
