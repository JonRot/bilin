import '/aa_nav_pages/comp/disponibilidades_b_t_n/disponibilidades_b_t_n_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'availability_list_request_widget.dart'
    show AvailabilityListRequestWidget;
import 'package:flutter/material.dart';

class AvailabilityListRequestModel
    extends FlutterFlowModel<AvailabilityListRequestWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DisponibilidadesBTN component.
  late DisponibilidadesBTNModel disponibilidadesBTNModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    disponibilidadesBTNModel =
        createModel(context, () => DisponibilidadesBTNModel());
  }

  @override
  void dispose() {
    disponibilidadesBTNModel.dispose();
    tabBarController?.dispose();
  }
}
