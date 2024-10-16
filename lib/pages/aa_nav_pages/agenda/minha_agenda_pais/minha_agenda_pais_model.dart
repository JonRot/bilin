import '/components/dashboard/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'minha_agenda_pais_widget.dart' show MinhaAgendaPaisWidget;
import 'package:flutter/material.dart';

class MinhaAgendaPaisModel extends FlutterFlowModel<MinhaAgendaPaisWidget> {
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
