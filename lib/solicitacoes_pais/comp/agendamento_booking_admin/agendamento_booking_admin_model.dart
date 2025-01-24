import '/aa_nav_pages/comp/request_parents_title/request_parents_title_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/solicitacoes_pais/comp/user_sub_teacher/user_sub_teacher_widget.dart';
import 'agendamento_booking_admin_widget.dart'
    show AgendamentoBookingAdminWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AgendamentoBookingAdminModel
    extends FlutterFlowModel<AgendamentoBookingAdminWidget> {
  ///  Local state fields for this component.

  StudentRecord? studentRef;

  String? selectedTimetoTime;

  List<DocumentReference> listChatRef = [];
  void addToListChatRef(DocumentReference item) => listChatRef.add(item);
  void removeFromListChatRef(DocumentReference item) =>
      listChatRef.remove(item);
  void removeAtIndexFromListChatRef(int index) => listChatRef.removeAt(index);
  void insertAtIndexInListChatRef(int index, DocumentReference item) =>
      listChatRef.insert(index, item);
  void updateListChatRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listChatRef[index] = updateFn(listChatRef[index]);

  DocumentReference? chatReference;

  ///  State fields for stateful widgets in this component.

  // Model for requestParentsTitle component.
  late RequestParentsTitleModel requestParentsTitleModel;
  // Stores action output result for [Bottom Sheet - user_ListTeacher] action in Teacher widget.
  UsersRecord? userRefSelected1;
  // Stores action output result for [Firestore Query - Query a collection] action in Teacher widget.
  List<ChatsRecord>? chatRefComponentState;
  // Model for user_SubTeacher component.
  late UserSubTeacherModel userSubTeacherModel;
  // State field(s) for Day widget.
  FormFieldController<List<String>>? dayValueController;
  String? get dayValue => dayValueController?.value?.firstOrNull;
  set dayValue(String? val) =>
      dayValueController?.value = val != null ? [val] : [];
  // State field(s) for SegTimes widget.
  FormFieldController<List<String>>? segTimesValueController;
  String? get segTimesValue => segTimesValueController?.value?.firstOrNull;
  set segTimesValue(String? val) =>
      segTimesValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Create Document] action in AgendarBTN widget.
  ChatsRecord? newChatThread1;
  // Stores action output result for [Backend Call - Create Document] action in AgendarBTN widget.
  BookingsRecord? bookingSeg;

  @override
  void initState(BuildContext context) {
    requestParentsTitleModel =
        createModel(context, () => RequestParentsTitleModel());
    userSubTeacherModel = createModel(context, () => UserSubTeacherModel());
  }

  @override
  void dispose() {
    requestParentsTitleModel.dispose();
    userSubTeacherModel.dispose();
  }
}
