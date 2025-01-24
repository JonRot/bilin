import '/flutter_flow/flutter_flow_util.dart';
import '/perfil_login_criar/comp/login_images/login_images_widget.dart';
import '/perfil_login_criar/comp/login_logo/login_logo_widget.dart';
import 'auth_login_widget.dart' show AuthLoginWidget;
import 'package:flutter/material.dart';

class AuthLoginModel extends FlutterFlowModel<AuthLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for loginImages component.
  late LoginImagesModel loginImagesModel;
  // Model for LoginLogo component.
  late LoginLogoModel loginLogoModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    loginImagesModel = createModel(context, () => LoginImagesModel());
    loginLogoModel = createModel(context, () => LoginLogoModel());
    passwordVisibility = false;
  }

  @override
  void dispose() {
    loginImagesModel.dispose();
    loginLogoModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
