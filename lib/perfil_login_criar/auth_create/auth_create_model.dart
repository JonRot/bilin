import '/flutter_flow/flutter_flow_util.dart';
import '/perfil_login_criar/comp/login_logo/login_logo_widget.dart';
import 'auth_create_widget.dart' show AuthCreateWidget;
import 'package:flutter/material.dart';

class AuthCreateModel extends FlutterFlowModel<AuthCreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for LoginLogo component.
  late LoginLogoModel loginLogoModel;
  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  String? _nomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ry8gfhoz' /* Nome obrigatório */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'xstwosc8' /* Nome Invalido */,
      );
    }

    return null;
  }

  // State field(s) for Sobrenome widget.
  FocusNode? sobrenomeFocusNode;
  TextEditingController? sobrenomeTextController;
  String? Function(BuildContext, String?)? sobrenomeTextControllerValidator;
  String? _sobrenomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j39mqll4' /* Nome obrigatório */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'j6i8c1io' /* Sobrenome Invalido */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'un7td3ag' /* Email obrigatório */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '4pm3u5eu' /* Email Invalido */,
      );
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j6t7j7uc' /* Senha obrigatória */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'a1j036pw' /* A senha deve ter 8-20 caracter... */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'fzkbdlj4' /* A senha deve ter 8-20 caracter... */,
      );
    }
    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#\$%^&+=!])([A-Za-z\\d@#\$%^&+=!]{8,20})\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'pj7gt3vj' /* A senha deve incluir maiúscula... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    loginLogoModel = createModel(context, () => LoginLogoModel());
    nomeTextControllerValidator = _nomeTextControllerValidator;
    sobrenomeTextControllerValidator = _sobrenomeTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    loginLogoModel.dispose();
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    sobrenomeFocusNode?.dispose();
    sobrenomeTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }

  /// Action blocks.
  Future password(BuildContext context) async {}
}
