import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/solicitacoes_pais/comp/user_sub_aluno/user_sub_aluno_widget.dart';
import 'package:flutter/material.dart';
import 'user_list_student_model.dart';
export 'user_list_student_model.dart';

class UserListStudentWidget extends StatefulWidget {
  const UserListStudentWidget({super.key});

  @override
  State<UserListStudentWidget> createState() => _UserListStudentWidgetState();
}

class _UserListStudentWidgetState extends State<UserListStudentWidget> {
  late UserListStudentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListStudentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxHeight: 500.0,
          ),
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
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 4.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'dg91xh6q' /* Assign User */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '2yhnx05a' /* Select a user from the list be... */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Expanded(
                child: StreamBuilder<List<StudentRecord>>(
                  stream: queryStudentRecord(
                    queryBuilder: (studentRecord) => studentRecord
                        .where(
                          'studentParentRef',
                          isEqualTo: currentUserReference,
                        )
                        .orderBy('studentName', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const Center(
                        child: SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0x6C57636C),
                            ),
                          ),
                        ),
                      );
                    }
                    List<StudentRecord> listViewStudentRecordList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewStudentRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewStudentRecord =
                            listViewStudentRecordList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context, listViewStudentRecord);
                            },
                            child: wrapWithModel(
                              model: _model.userSubAlunoModels.getModel(
                                listViewStudentRecord.reference.id,
                                listViewIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: UserSubAlunoWidget(
                                key: Key(
                                  'Key3ve_${listViewStudentRecord.reference.id}',
                                ),
                                userRef: listViewStudentRecord,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Divider(
                height: 2.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              MouseRegion(
                opaque: false,
                cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                onEnter: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered = true);
                }),
                onExit: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered = false);
                }),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _model.mouseRegionHovered
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 16.0, 12.0, 16.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'z882ytm6' /* Close */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
