import '/components/perfil/logo/logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_welcome_widget.dart' show AuthWelcomeWidget;
import 'package:flutter/material.dart';

class AuthWelcomeModel extends FlutterFlowModel<AuthWelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Logo2.
  late LogoModel logo2Model;

  @override
  void initState(BuildContext context) {
    logo2Model = createModel(context, () => LogoModel());
  }

  @override
  void dispose() {
    logo2Model.dispose();
  }
}
