import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_messages_components/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'chat_list_done_model.dart';
export 'chat_list_done_model.dart';

class ChatListDoneWidget extends StatefulWidget {
  const ChatListDoneWidget({
    super.key,
    this.buscarChatString,
  });

  final String? buscarChatString;

  @override
  State<ChatListDoneWidget> createState() => _ChatListDoneWidgetState();
}

class _ChatListDoneWidgetState extends State<ChatListDoneWidget> {
  late ChatListDoneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatListDoneModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: StreamBuilder<List<ChatsRecord>>(
        stream: queryChatsRecord(
          queryBuilder: (chatsRecord) =>
              chatsRecord.orderBy('last_message_time', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitPulse(
                  color: Color(0x6C57636C),
                  size: 30.0,
                ),
              ),
            );
          }
          List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
          if (listViewChatsRecordList.isEmpty) {
            return Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: EmptyStateSimpleWidget(
                  icon: Icon(
                    FFIcons.kasxas,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 90.0,
                  ),
                  title: 'Sem Mensagens',
                  body: 'Solicite uma noma converssa',
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(
              0,
              0,
              0,
              60.0,
            ),
            scrollDirection: Axis.vertical,
            itemCount: listViewChatsRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewChatsRecord =
                  listViewChatsRecordList[listViewIndex];
              return FutureBuilder<UsersRecord>(
                future: FFAppState().userDocQuery(
                  uniqueQueryKey: listViewChatsRecord.reference.id,
                  requestFn: () => UsersRecord.getDocumentOnce(
                      listViewChatsRecord.users
                          .where((e) => e != currentUserReference)
                          .toList()
                          .first),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SpinKitPulse(
                          color: Color(0x6C57636C),
                          size: 30.0,
                        ),
                      ),
                    );
                  }

                  final containerUsersRecord = snapshot.data!;

                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'chat_Details',
                        queryParameters: {
                          'chatRef': serializeParam(
                            listViewChatsRecord,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'chatRef': listViewChatsRecord,
                        },
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context).alternate,
                              offset: const Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(listViewChatsRecord
                              .users
                              .where((e) => e != currentUserReference)
                              .toList()
                              .last),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const Center(
                                child: SizedBox(
                                  width: 30.0,
                                  height: 30.0,
                                  child: SpinKitPulse(
                                    color: Color(0x6C57636C),
                                    size: 30.0,
                                  ),
                                ),
                              );
                            }

                            final singleORgorupUsersRecord = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                if (listViewChatsRecord.users.length <= 2) {
                                  return Visibility(
                                    visible: functions.searchResultChat(
                                        widget.buscarChatString!,
                                        '${singleORgorupUsersRecord.displayName}${containerUsersRecord.displayName}'),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 12.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 1.0),
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    containerUsersRecord
                                                        .photoUrl,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                                  ),
                                                  width: 55.0,
                                                  height: 55.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${valueOrDefault<String>(
                                                              containerUsersRecord
                                                                          .displayName ==
                                                                      singleORgorupUsersRecord
                                                                          .displayName
                                                                  ? 'A. Bilin'
                                                                  : containerUsersRecord
                                                                      .displayName,
                                                              'null',
                                                            )}, ${singleORgorupUsersRecord.displayName}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          functions.formatDateTimeChat(
                                                              listViewChatsRecord
                                                                  .lastMessageTime!),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listViewChatsRecord
                                                                  .lastMessage,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (!listViewChatsRecord
                                                          .lastMessageSeenBy
                                                          .contains(
                                                              currentUserReference))
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 16.0,
                                                            height: 16.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 16.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Visibility(
                                    visible: functions.searchResultChat(
                                        widget.buscarChatString!,
                                        '${singleORgorupUsersRecord.displayName}${containerUsersRecord.displayName}'),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 12.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 55.0,
                                            height: 55.0,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (containerUsersRecord
                                                                    .photoUrl !=
                                                                '') {
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                              fadeOutDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                              imageUrl:
                                                                  containerUsersRecord
                                                                      .photoUrl,
                                                              width: 55.0,
                                                              height: 55.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    2.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  containerUsersRecord
                                                                      .displayName,
                                                                  'A',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 1,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (containerUsersRecord
                                                                    .photoUrl !=
                                                                '') {
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          200),
                                                              fadeOutDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          200),
                                                              imageUrl:
                                                                  valueOrDefault<
                                                                      String>(
                                                                containerUsersRecord
                                                                    .photoUrl,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                                              ),
                                                              width: 55.0,
                                                              height: 55.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 55.0,
                                                            height: 55.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerUsersRecord
                                                                    .displayName,
                                                                'A',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 1,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${valueOrDefault<String>(
                                                              containerUsersRecord
                                                                          .displayName ==
                                                                      singleORgorupUsersRecord
                                                                          .displayName
                                                                  ? 'A. Bilin'
                                                                  : containerUsersRecord
                                                                      .displayName,
                                                              'null',
                                                            )}, ${singleORgorupUsersRecord.displayName}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          functions.formatDateTimeChat(
                                                              listViewChatsRecord
                                                                  .lastMessageTime!),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        listViewChatsRecord
                                                            .lastMessage,
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      if (!listViewChatsRecord
                                                          .lastMessageSeenBy
                                                          .contains(
                                                              currentUserReference))
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 16.0,
                                                            height: 16.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 16.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
