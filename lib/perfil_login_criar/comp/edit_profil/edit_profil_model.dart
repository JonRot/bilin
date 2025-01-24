import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profil_widget.dart' show EditProfilWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfilModel extends FlutterFlowModel<EditProfilWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5tufv1na' /* Nome obrigatório */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '82ayu0hi' /* Nome muito curto */,
      );
    }

    return null;
  }

  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4e3slq38' /* Sobrenome obrigatório */,
      );
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3pw844cr' /* CPF obrigatório */,
      );
    }

    if (val.length < 14) {
      return FFLocalizations.of(context).getText(
        '2ym46yfu' /* CFP invalido */,
      );
    }

    return null;
  }

  // State field(s) for celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularTextController;
  final celularMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? celularTextControllerValidator;
  String? _celularTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nzaik775' /* Celular obrigatório */,
      );
    }

    if (val.length < 14) {
      return FFLocalizations.of(context).getText(
        'x33r50rp' /* Celular Invalido */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    cpfTextControllerValidator = _cpfTextControllerValidator;
    celularTextControllerValidator = _celularTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    celularFocusNode?.dispose();
    celularTextController?.dispose();
  }
}
