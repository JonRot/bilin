import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/messages/comp/empty_state_simple/empty_state_simple_widget.dart';
import '/solicitacoes_pais/comp/user_sub_teacher/user_sub_teacher_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_list_teacher_model.dart';
export 'user_list_teacher_model.dart';

class UserListTeacherWidget extends StatefulWidget {
  const UserListTeacherWidget({
    super.key,
    required this.classes,
    required this.bookingDoc,
    required this.studentDoc,
    required this.cidadeDoc,
  });

  final ClassesRecord? classes;
  final List<BookingsRecord>? bookingDoc;
  final StudentRecord? studentDoc;
  final CidadeRecord? cidadeDoc;

  @override
  State<UserListTeacherWidget> createState() => _UserListTeacherWidgetState();
}

class _UserListTeacherWidgetState extends State<UserListTeacherWidget> {
  late UserListTeacherModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListTeacherModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 4.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    's2gh3u74' /* Teachers */,
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
                    'mj2bxepw' /* Clique em uma teacher abaixo. */,
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
              Flexible(
                child: FutureBuilder<List<UsersRecord>>(
                  future: queryUsersRecordOnce(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'role',
                      isEqualTo: Role.Teacher.serialize(),
                    ),
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
                    List<UsersRecord> listViewUsersRecordList = snapshot.data!
                        .where((u) => u.uid != currentUserUid)
                        .toList();
                    if (listViewUsersRecordList.isEmpty) {
                      return EmptyStateSimpleWidget(
                        icon: FaIcon(
                          FontAwesomeIcons.userGraduate,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                        title: 'Nenhuma Teacher Disponivel',
                        body:
                            'Todas as Teachers estao dando aulas para outros estudantes nesse horario.',
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUsersRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewUsersRecord =
                            listViewUsersRecordList[listViewIndex];
                        return Visibility(
                          visible: functions.getAvailabileSlotsForTeacherSelect(
                                  widget.bookingDoc!
                                      .where((e) =>
                                          (e.bookingStudentRef ==
                                              widget.studentDoc?.reference) &&
                                          (e.bookingTeacherRef ==
                                              listViewUsersRecord.reference))
                                      .toList(),
                                  widget.classes!.classAvailability.toList(),
                                  widget.studentDoc!.studentAvailability
                                      .toList()) ==
                              true,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context, listViewUsersRecord);
                            },
                            child: wrapWithModel(
                              model: _model.userSubTeacherModels.getModel(
                                listViewUsersRecord.reference.id,
                                listViewIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: UserSubTeacherWidget(
                                key: Key(
                                  'Key0sv_${listViewUsersRecord.reference.id}',
                                ),
                                userRefUsers: listViewUsersRecord,
                                action: () async {},
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
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '3mj94mfg' /* Cancelar */,
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
