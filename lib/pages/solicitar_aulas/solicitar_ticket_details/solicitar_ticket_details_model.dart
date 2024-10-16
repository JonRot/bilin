import '/components/solicitar_aulas_components/user_sub_aluno/user_sub_aluno_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'solicitar_ticket_details_widget.dart' show SolicitarTicketDetailsWidget;
import 'package:flutter/material.dart';

class SolicitarTicketDetailsModel
    extends FlutterFlowModel<SolicitarTicketDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for user_SubAluno component.
  late UserSubAlunoModel userSubAlunoModel;

  @override
  void initState(BuildContext context) {
    userSubAlunoModel = createModel(context, () => UserSubAlunoModel());
  }

  @override
  void dispose() {
    userSubAlunoModel.dispose();
  }
}
