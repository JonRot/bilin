import '/components/perfil/edit_profil/edit_profil_widget.dart';
import '/components/perfil/logo/logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_create_perfil_widget.dart' show AuthCreatePerfilWidget;
import 'package:flutter/material.dart';

class AuthCreatePerfilModel extends FlutterFlowModel<AuthCreatePerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Logo component.
  late LogoModel logoModel;
  // Model for editProfil component.
  late EditProfilModel editProfilModel;

  @override
  void initState(BuildContext context) {
    logoModel = createModel(context, () => LogoModel());
    editProfilModel = createModel(context, () => EditProfilModel());
  }

  @override
  void dispose() {
    logoModel.dispose();
    editProfilModel.dispose();
  }
}
