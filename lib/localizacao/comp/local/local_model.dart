import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/localizacao/comp/locatio_one/locatio_one_widget.dart';
import 'local_widget.dart' show LocalWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LocalModel extends FlutterFlowModel<LocalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  final cepMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  String? _cepTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2m3yuzwv' /* CEP invalido! */,
      );
    }

    if (!RegExp('^\\d{5}-\\d{3}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'uw0eud96' /* CEP invalido! */,
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
