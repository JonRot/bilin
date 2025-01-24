import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/messages/comp/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'chat_list_done_model.dart';
export 'chat_list_done_model.dart';

class ChatListDoneWidget extends StatefulWidget {
  const ChatListDoneWidget({
    super.key,
    String? buscarChatString,
    this.filterType,
  }) : buscarChatString = buscarChatString ?? 'null';

  final String buscarChatString;
  final Role? filterType;

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
    return Container(
      decoration: const BoxDecoration(),
      child: StreamBuilder<List<ChatsRecord>>(
        stream: FFAppState().chatList(
          requestFn: () => queryChatsRecord(
            queryBuilder: (chatsRecord) =>
                chatsRecord.orderBy('last_message_time', descending: true),
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

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(
              0,
              0,
              0,
              90.0,
            ),
            scrollDirection: Axis.vertical,
            itemCount: listViewChatsRecordList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 4.0),
            itemBuilder: (context, listViewIndex) {
              final listViewChatsRecord =
                  listViewChatsRecordList[listViewIndex];
              return FutureBuilder<UsersRecord>(
                future: FFAppState().userDocQuery(
                  uniqueQueryKey: listViewChatsRecord.reference.id,
                  requestFn: () =>
                      UsersRecord.getDocumentOnce(listViewChatsRecord.userA!),
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

                  final usersFirstUsersRecord = snapshot.data!;

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

                      FFAppState().clearChatListCache();
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
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<UsersRecord>(
                              stream: FFAppState().userchats(
                                uniqueQueryKey:
                                    listViewChatsRecord.reference.id,
                                requestFn: () => UsersRecord.getDocument(
                                    listViewChatsRecord.userB!),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0x6C57636C),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final singleORgorupUsersRecord = snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    if ((listViewChatsRecord.users.length <=
                                            2) &&
                                        (listViewChatsRecord.userA?.id ==
                                            'lCcxR075XsSksJQIA6oSN6TuhfX2')) {
                                      return Visibility(
                                        visible: (widget.filterType == null) ||
                                            ((singleORgorupUsersRecord.role ==
                                                    widget.filterType) ||
                                                (usersFirstUsersRecord.role ==
                                                    widget.filterType)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible: functions.searchResultChat(
                                                  widget.buscarChatString,
                                                  '${'${singleORgorupUsersRecord.displayName} ${singleORgorupUsersRecord.displayLastName}'},${'${usersFirstUsersRecord.displayName} ${usersFirstUsersRecord.displayLastName}'}'),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        if (usersFirstUsersRecord
                                                                    .photoUrl !=
                                                                '') {
                                                          return Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                              child:
                                                                  Image.network(
                                                                singleORgorupUsersRecord
                                                                            .reference !=
                                                                        currentUserReference
                                                                    ? singleORgorupUsersRecord
                                                                        .photoUrl
                                                                    : usersFirstUsersRecord
                                                                        .photoUrl,
                                                                width: 45.0,
                                                                height: 45.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                usersFirstUsersRecord
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      singleORgorupUsersRecord.reference ==
                                                                              currentUserReference
                                                                          ? '${usersFirstUsersRecord.displayName} ${usersFirstUsersRecord.displayLastName}'
                                                                          : '${singleORgorupUsersRecord.displayName} ${singleORgorupUsersRecord.displayLastName}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    functions.dateTimeToStringTime(
                                                                        listViewChatsRecord
                                                                            .lastMessageTime!),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Wrap(
                                                                        spacing:
                                                                            0.0,
                                                                        runSpacing:
                                                                            0.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          Text(
                                                                            listViewChatsRecord.lastMessage.maybeHandleOverflow(
                                                                              maxChars: 40,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (!listViewChatsRecord
                                                                    .lastMessageSeenBy
                                                                    .contains(
                                                                        currentUserReference))
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ].divide(const SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Visibility(
                                        visible: (widget.filterType == null) ||
                                            ((singleORgorupUsersRecord.role ==
                                                    widget.filterType) ||
                                                (usersFirstUsersRecord.role ==
                                                    widget.filterType)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible: functions.searchResultChat(
                                                  widget.buscarChatString,
                                                  '${'${singleORgorupUsersRecord.displayName} ${singleORgorupUsersRecord.displayLastName}'},${'${usersFirstUsersRecord.displayName} ${usersFirstUsersRecord.displayLastName}'}'),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 45.0,
                                                      height: 45.0,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (singleORgorupUsersRecord
                                                                              .photoUrl !=
                                                                          '') {
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            const Duration(milliseconds: 100),
                                                                        fadeOutDuration:
                                                                            const Duration(milliseconds: 100),
                                                                        imageUrl:
                                                                            singleORgorupUsersRecord.photoUrl,
                                                                        width:
                                                                            45.0,
                                                                        height:
                                                                            45.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              2.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            45.0,
                                                                        height:
                                                                            45.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            usersFirstUsersRecord.displayName,
                                                                            'A',
                                                                          ).maybeHandleOverflow(
                                                                            maxChars:
                                                                                1,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
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
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (usersFirstUsersRecord
                                                                              .photoUrl !=
                                                                          '') {
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            const Duration(milliseconds: 200),
                                                                        fadeOutDuration:
                                                                            const Duration(milliseconds: 200),
                                                                        imageUrl:
                                                                            usersFirstUsersRecord.photoUrl,
                                                                        width:
                                                                            45.0,
                                                                        height:
                                                                            45.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Container(
                                                                      width:
                                                                          45.0,
                                                                      height:
                                                                          45.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50.0),
                                                                      ),
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          usersFirstUsersRecord
                                                                              .displayName,
                                                                          'A',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
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
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${singleORgorupUsersRecord.reference != currentUserReference ? '${usersFirstUsersRecord.displayName} ${usersFirstUsersRecord.displayLastName}' : '${singleORgorupUsersRecord.displayName} ${singleORgorupUsersRecord.displayLastName}'}, ${singleORgorupUsersRecord.reference != currentUserReference ? '${singleORgorupUsersRecord.displayName} ${singleORgorupUsersRecord.displayLastName}' : '${usersFirstUsersRecord.displayName} ${usersFirstUsersRecord.displayLastName}'}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    functions.dateTimeToStringTime(
                                                                        listViewChatsRecord
                                                                            .lastMessageTime!),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Wrap(
                                                                  spacing: 0.0,
                                                                  runSpacing:
                                                                      0.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Text(
                                                                      listViewChatsRecord
                                                                          .lastMessage
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            40,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (!listViewChatsRecord
                                                                    .lastMessageSeenBy
                                                                    .contains(
                                                                        currentUserReference))
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          15.0,
                                                                      height:
                                                                          15.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ].divide(const SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ],
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
