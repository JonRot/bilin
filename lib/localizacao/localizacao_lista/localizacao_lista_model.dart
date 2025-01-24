import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/localizacao/comp/locatio_one/locatio_one_widget.dart';
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
      return FFLocalizations.of(context).getText(
        '9xdmpr6v' /* CEP invalido! */,
      );
    }

    if (!RegExp('^\\d{5}-\\d{3}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'j4dvusqo' /* CEP invalido! */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (latlngAPI)] action in IconButton widget.
  ApiCallResponse? cEPResultAPI;
  // Models for locatioOne dynamic component.
  late FlutterFlowDynamicModels<LocatioOneModel> locatioOneModels;

  @override
  void initState(BuildContext context) {
    cepTextControllerValidator = _cepTextControllerValidator;
    locatioOneModels = FlutterFlowDynamicModels(() => LocatioOneModel());
  }

  @override
  void dispose() {
    cepFocusNode?.dispose();
    cepTextController?.dispose();

    locatioOneModels.dispose();
  }
}
