import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'perfil_aluno_bilin_edit_widget.dart' show PerfilAlunoBilinEditWidget;
import 'package:flutter/material.dart';

class PerfilAlunoBilinEditModel
    extends FlutterFlowModel<PerfilAlunoBilinEditWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for AlunoName widget.
  FocusNode? alunoNameFocusNode;
  TextEditingController? alunoNameTextController;
  String? Function(BuildContext, String?)? alunoNameTextControllerValidator;
  String? _alunoNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kvzmx0ya' /* Nome Obrigatório */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'ntkepuzj' /* Nome muito curto. */,
      );
    }
    if (val.length > 14) {
      return FFLocalizations.of(context).getText(
        'wop0ddyx' /* Nome muito longo. */,
      );
    }

    return null;
  }

  // State field(s) for AlunoSobrenome widget.
  FocusNode? alunoSobrenomeFocusNode;
  TextEditingController? alunoSobrenomeTextController;
  String? Function(BuildContext, String?)?
      alunoSobrenomeTextControllerValidator;
  String? _alunoSobrenomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0krxl8q3' /* Sobrenome Obrigatório */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '8goxbwwg' /* Nome muito curto. */,
      );
    }
    if (val.length > 14) {
      return FFLocalizations.of(context).getText(
        '7e5waxu5' /* Nome muito longo. */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for AlunoAlergia widget.
  FocusNode? alunoAlergiaFocusNode;
  TextEditingController? alunoAlergiaTextController;
  String? Function(BuildContext, String?)? alunoAlergiaTextControllerValidator;
  String? _alunoAlergiaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'q0yb0m1i' /* Obrigatório informar */,
      );
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;

  @override
  void initState(BuildContext context) {
    alunoNameTextControllerValidator = _alunoNameTextControllerValidator;
    alunoSobrenomeTextControllerValidator =
        _alunoSobrenomeTextControllerValidator;
    alunoAlergiaTextControllerValidator = _alunoAlergiaTextControllerValidator;
  }

  @override
  void dispose() {
    alunoNameFocusNode?.dispose();
    alunoNameTextController?.dispose();

    alunoSobrenomeFocusNode?.dispose();
    alunoSobrenomeTextController?.dispose();

    alunoAlergiaFocusNode?.dispose();
    alunoAlergiaTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
