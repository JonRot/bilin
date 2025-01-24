import '/flutter_flow/flutter_flow_util.dart';
import '/perfil_login_criar/comp/login_logo/login_logo_widget.dart';
import 'auth_forgot_password_widget.dart' show AuthForgotPasswordWidget;
import 'package:flutter/material.dart';

class AuthForgotPasswordModel
    extends FlutterFlowModel<AuthForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LoginLogo component.
  late LoginLogoModel loginLogoModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {
    loginLogoModel = createModel(context, () => LoginLogoModel());
  }

  @override
  void dispose() {
    loginLogoModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
