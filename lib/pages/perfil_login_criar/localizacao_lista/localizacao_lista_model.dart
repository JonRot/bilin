import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'localizacao_lista_widget.dart' show LocalizacaoListaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LocalizacaoListaModel extends FlutterFlowModel<LocalizacaoListaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  final cepMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  String? _cepTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'CEP invalido!';
    }

    if (!RegExp('^\\d{5}-\\d{3}\$').hasMatch(val)) {
      return 'CEP invalido!';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (apiBuscarCep)] action in IconButton widget.
  ApiCallResponse? apiResultxx9;

  @override
  void initState(BuildContext context) {
    cepTextControllerValidator = _cepTextControllerValidator;
  }

  @override
  void dispose() {
    cepFocusNode?.dispose();
    cepTextController?.dispose();
  }
}
