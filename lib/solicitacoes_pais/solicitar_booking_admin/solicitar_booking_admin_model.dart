import '/aa_nav_pages/comp/solicitacao_pais_b_t_n/solicitacao_pais_b_t_n_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'solicitar_booking_admin_widget.dart' show SolicitarBookingAdminWidget;
import 'package:flutter/material.dart';

class SolicitarBookingAdminModel
    extends FlutterFlowModel<SolicitarBookingAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SolicitacaoPaisBTN component.
  late SolicitacaoPaisBTNModel solicitacaoPaisBTNModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    solicitacaoPaisBTNModel =
        createModel(context, () => SolicitacaoPaisBTNModel());
  }

  @override
  void dispose() {
    solicitacaoPaisBTNModel.dispose();
    tabBarController?.dispose();
  }
}
