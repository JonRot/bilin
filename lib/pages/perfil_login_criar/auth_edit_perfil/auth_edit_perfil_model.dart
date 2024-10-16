import '/components/perfil/edit_profil/edit_profil_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_edit_perfil_widget.dart' show AuthEditPerfilWidget;
import 'package:flutter/material.dart';

class AuthEditPerfilModel extends FlutterFlowModel<AuthEditPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for editProfil component.
  late EditProfilModel editProfilModel;

  @override
  void initState(BuildContext context) {
    editProfilModel = createModel(context, () => EditProfilModel());
  }

  @override
  void dispose() {
    editProfilModel.dispose();
  }
}
