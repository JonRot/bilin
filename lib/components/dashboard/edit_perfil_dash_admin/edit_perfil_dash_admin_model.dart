import '/components/perfil/edit_profil_dashboard/edit_profil_dashboard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_perfil_dash_admin_widget.dart' show EditPerfilDashAdminWidget;
import 'package:flutter/material.dart';

class EditPerfilDashAdminModel
    extends FlutterFlowModel<EditPerfilDashAdminWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for editProfilDashboard component.
  late EditProfilDashboardModel editProfilDashboardModel;

  @override
  void initState(BuildContext context) {
    editProfilDashboardModel =
        createModel(context, () => EditProfilDashboardModel());
  }

  @override
  void dispose() {
    editProfilDashboardModel.dispose();
  }
}
