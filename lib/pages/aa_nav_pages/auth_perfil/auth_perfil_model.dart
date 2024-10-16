import '/components/dashboard/nav_bar/nav_bar_widget.dart';
import '/components/z_extra/light_switch/light_switch_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_perfil_widget.dart' show AuthPerfilWidget;
import 'package:flutter/material.dart';

class AuthPerfilModel extends FlutterFlowModel<AuthPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LightSwitch component.
  late LightSwitchModel lightSwitchModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    lightSwitchModel = createModel(context, () => LightSwitchModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    lightSwitchModel.dispose();
    navBarModel.dispose();
  }
}
