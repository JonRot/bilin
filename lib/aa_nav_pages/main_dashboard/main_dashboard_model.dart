import '/aa_nav_pages/comp/disponibilidades_b_t_n/disponibilidades_b_t_n_widget.dart';
import '/aa_nav_pages/comp/itineario1/itineario1_widget.dart';
import '/aa_nav_pages/comp/solicitacao_pais_b_t_n/solicitacao_pais_b_t_n_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'main_dashboard_widget.dart' show MainDashboardWidget;
import 'package:flutter/material.dart';

class MainDashboardModel extends FlutterFlowModel<MainDashboardWidget> {
  ///  Local state fields for this page.

  DocumentReference? bookingRef;

  ///  State fields for stateful widgets in this page.

  // Model for DisponibilidadesBTN component.
  late DisponibilidadesBTNModel disponibilidadesBTNModel;
  // Model for SolicitacaoPaisBTN component.
  late SolicitacaoPaisBTNModel solicitacaoPaisBTNModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Day widget.
  FormFieldController<List<String>>? dayValueController;
  String? get dayValue => dayValueController?.value?.firstOrNull;
  set dayValue(String? val) =>
      dayValueController?.value = val != null ? [val] : [];
  // Models for itineario1 dynamic component.
  late FlutterFlowDynamicModels<Itineario1Model> itineario1Models;

  @override
  void initState(BuildContext context) {
    disponibilidadesBTNModel =
        createModel(context, () => DisponibilidadesBTNModel());
    solicitacaoPaisBTNModel =
        createModel(context, () => SolicitacaoPaisBTNModel());
    itineario1Models = FlutterFlowDynamicModels(() => Itineario1Model());
  }

  @override
  void dispose() {
    disponibilidadesBTNModel.dispose();
    solicitacaoPaisBTNModel.dispose();
    tabBarController?.dispose();
    itineario1Models.dispose();
  }
}
