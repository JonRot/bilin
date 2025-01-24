import '/flutter_flow/flutter_flow_util.dart';
import '/perfil_login_criar/comp/login_images/login_images_widget.dart';
import '/perfil_login_criar/comp/login_logo/login_logo_widget.dart';
import 'auth_welcome_widget.dart' show AuthWelcomeWidget;
import 'package:flutter/material.dart';

class AuthWelcomeModel extends FlutterFlowModel<AuthWelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for loginImages component.
  late LoginImagesModel loginImagesModel;
  // Model for LoginLogo component.
  late LoginLogoModel loginLogoModel;

  @override
  void initState(BuildContext context) {
    loginImagesModel = createModel(context, () => LoginImagesModel());
    loginLogoModel = createModel(context, () => LoginLogoModel());
  }

  @override
  void dispose() {
    loginImagesModel.dispose();
    loginLogoModel.dispose();
  }
}
