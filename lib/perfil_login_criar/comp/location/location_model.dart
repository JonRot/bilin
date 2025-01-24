import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_widget.dart' show LocationWidget;
import 'package:flutter/material.dart';

class LocationModel extends FlutterFlowModel<LocationWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  String? _tituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bkud2lww' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for Rua widget.
  FocusNode? ruaFocusNode;
  TextEditingController? ruaTextController;
  String? Function(BuildContext, String?)? ruaTextControllerValidator;
  String? _ruaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'extt5wi7' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for Numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroTextController;
  String? Function(BuildContext, String?)? numeroTextControllerValidator;
  String? _numeroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uxpg7hn7' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for Uni widget.
  FocusNode? uniFocusNode;
  TextEditingController? uniTextController;
  String? Function(BuildContext, String?)? uniTextControllerValidator;
  // State field(s) for Bairro widget.
  FocusNode? bairroFocusNode;
  TextEditingController? bairroTextController;
  String? Function(BuildContext, String?)? bairroTextControllerValidator;
  String? _bairroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ifn6xnfo' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for Cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeTextController;
  String? Function(BuildContext, String?)? cidadeTextControllerValidator;
  String? _cidadeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '68xh6772' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for Estado widget.
  FocusNode? estadoFocusNode;
  TextEditingController? estadoTextController;
  String? Function(BuildContext, String?)? estadoTextControllerValidator;
  String? _estadoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ah5tsyhx' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CidadeRecord? createdLocation;

  @override
  void initState(BuildContext context) {
    tituloTextControllerValidator = _tituloTextControllerValidator;
    ruaTextControllerValidator = _ruaTextControllerValidator;
    numeroTextControllerValidator = _numeroTextControllerValidator;
    bairroTextControllerValidator = _bairroTextControllerValidator;
    cidadeTextControllerValidator = _cidadeTextControllerValidator;
    estadoTextControllerValidator = _estadoTextControllerValidator;
  }

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    ruaFocusNode?.dispose();
    ruaTextController?.dispose();

    numeroFocusNode?.dispose();
    numeroTextController?.dispose();

    uniFocusNode?.dispose();
    uniTextController?.dispose();

    bairroFocusNode?.dispose();
    bairroTextController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeTextController?.dispose();

    estadoFocusNode?.dispose();
    estadoTextController?.dispose();
  }
}
