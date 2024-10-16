import '/backend/backend.dart';
import '/components/perfil/edit_profil_dashboard/edit_profil_dashboard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'edit_perfil_dash_admin_model.dart';
export 'edit_perfil_dash_admin_model.dart';

class EditPerfilDashAdminWidget extends StatefulWidget {
  const EditPerfilDashAdminWidget({
    super.key,
    required this.userID,
    String? uName,
    required this.uRole,
    required this.uDescription,
    required this.uPhoto,
    required this.uTitle,
    required this.uComfirm,
    required this.chatRef,
  }) : uName = uName ?? '';

  final DocumentReference? userID;
  final String uName;
  final String? uRole;
  final String? uDescription;
  final String? uPhoto;
  final String? uTitle;
  final String? uComfirm;
  final ChatsRecord? chatRef;

  @override
  State<EditPerfilDashAdminWidget> createState() =>
      _EditPerfilDashAdminWidgetState();
}

class _EditPerfilDashAdminWidgetState extends State<EditPerfilDashAdminWidget> {
  late EditPerfilDashAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPerfilDashAdminModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 600.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    wrapWithModel(
                      model: _model.editProfilDashboardModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: EditProfilDashboardWidget(
                        chatRef: widget.chatRef!,
                        uID: widget.userID!,
                        uName: widget.uName,
                        uRole: widget.uRole!,
                        uDescription: widget.uDescription!,
                        uImage: widget.uPhoto!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
