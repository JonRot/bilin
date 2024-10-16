import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/chat_messages_components/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'chat_invite_users_model.dart';
export 'chat_invite_users_model.dart';

class ChatInviteUsersWidget extends StatefulWidget {
  const ChatInviteUsersWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<ChatInviteUsersWidget> createState() => _ChatInviteUsersWidgetState();
}

class _ChatInviteUsersWidgetState extends State<ChatInviteUsersWidget> {
  late ChatInviteUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatInviteUsersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.chatRef != null) {
        // addChatUsers_ToList
        _model.friendsList =
            widget.chatRef!.users.toList().cast<DocumentReference>();
        safeSetState(() {});
      } else {
        // addUser_ToList
        _model.addToFriendsList(currentUserReference!);
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pessoas na conversa',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 4.0),
              child: FlutterFlowIconButton(
                borderRadius: 50.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'inclua ou exclua Pessoas',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          ((valueOrDefault<int>(
                                    _model.friendsList.length,
                                    0,
                                  ) -
                                  1))
                              .toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Selected',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child:
                        PagedListView<DocumentSnapshot<Object?>?, UsersRecord>(
                      pagingController: _model.setListViewController(
                        UsersRecord.collection.orderBy('display_name'),
                      ),
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        160.0,
                      ),
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => const Center(
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: SpinKitPulse(
                              color: Color(0x6C57636C),
                              size: 30.0,
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => const Center(
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: SpinKitPulse(
                              color: Color(0x6C57636C),
                              size: 30.0,
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) =>
                            EmptyStateSimpleWidget(
                          icon: Icon(
                            Icons.groups_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 90.0,
                          ),
                          title: 'No Friends',
                          body: 'No users exist to create a chat with.',
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewUsersRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return Visibility(
                            visible: (listViewUsersRecord.reference !=
                                    currentUserReference) &&
                                (listViewUsersRecord.role != Role.Admin) &&
                                (listViewUsersRecord.role != Role.SuperAdmin),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Container(
                                width: 100.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: _model.friendsList.contains(
                                          listViewUsersRecord.reference)
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: _model.friendsList.contains(
                                            listViewUsersRecord.reference)
                                        ? FlutterFlowTheme.of(context).accent2
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 200),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 200),
                                            imageUrl: valueOrDefault<String>(
                                              listViewUsersRecord.photoUrl,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bilin-app-p2qg8h/assets/3wucjoleha9g/user-icon-on-transparent-background-free-png.webp',
                                            ),
                                            width: 44.0,
                                            height: 44.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Theme(
                                        data: ThemeData(
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: CheckboxListTile(
                                          value:
                                              _model.checkboxListTileValueMap[
                                                      listViewUsersRecord] ??=
                                                  _model.friendsList.contains(
                                                          listViewUsersRecord
                                                              .reference) ==
                                                      true,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.checkboxListTileValueMap[
                                                        listViewUsersRecord] =
                                                    newValue!);
                                            if (newValue!) {
                                              // addUser
                                              _model.addToFriendsList(
                                                  listViewUsersRecord
                                                      .reference);
                                              safeSetState(() {});
                                            } else {
                                              // removeUsser
                                              _model.removeFromFriendsList(
                                                  listViewUsersRecord
                                                      .reference);
                                              safeSetState(() {});
                                            }
                                          },
                                          title: Text(
                                            valueOrDefault<String>(
                                              listViewUsersRecord.displayName,
                                              'Ghost User',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 2.0,
                                                ),
                                          ),
                                          subtitle: Text(
                                            valueOrDefault<String>(
                                              listViewUsersRecord.role?.name,
                                              'Pai@ensinobilin.com',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          checkColor: Colors.white,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 8.0, 0.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 140.0,
                decoration: const BoxDecoration(),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Visibility(
                  visible: (((valueOrDefault<int>(
                                    _model.friendsList.length,
                                    0,
                                  ) -
                                  1))
                              .toString() ==
                          '2') ||
                      (((valueOrDefault<int>(
                                    _model.friendsList.length,
                                    0,
                                  ) -
                                  1))
                              .toString() ==
                          '1'),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.friendsList.length >= 2) {
                          if (widget.chatRef != null) {
                            // updateChat

                            await widget.chatRef!.reference.update({
                              ...mapToFirestore(
                                {
                                  'users': _model.friendsList,
                                },
                              ),
                            });
                            // updateChat
                            _model.updatedChatThread =
                                await queryChatsRecordOnce(
                              queryBuilder: (chatsRecord) => chatsRecord.where(
                                'group_chat_id',
                                isEqualTo: widget.chatRef?.groupChatId,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              'chat_Details',
                              queryParameters: {
                                'chatRef': serializeParam(
                                  _model.updatedChatThread,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'chatRef': _model.updatedChatThread,
                              },
                            );
                          } else {
                            // newChat

                            var chatsRecordReference =
                                ChatsRecord.collection.doc();
                            await chatsRecordReference.set({
                              ...createChatsRecordData(
                                userA: currentUserReference,
                                userB: _model.friendsList[1],
                                lastMessage: '',
                                lastMessageTime: getCurrentTimestamp,
                                lastMessageSentBy: currentUserReference,
                                groupChatId:
                                    random_data.randomInteger(1000000, 9999999),
                              ),
                              ...mapToFirestore(
                                {
                                  'users': _model.friendsList,
                                },
                              ),
                            });
                            _model.newChatThread =
                                ChatsRecord.getDocumentFromData({
                              ...createChatsRecordData(
                                userA: currentUserReference,
                                userB: _model.friendsList[1],
                                lastMessage: '',
                                lastMessageTime: getCurrentTimestamp,
                                lastMessageSentBy: currentUserReference,
                                groupChatId:
                                    random_data.randomInteger(1000000, 9999999),
                              ),
                              ...mapToFirestore(
                                {
                                  'users': _model.friendsList,
                                },
                              ),
                            }, chatsRecordReference);
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              'chat_Details',
                              queryParameters: {
                                'chatRef': serializeParam(
                                  _model.newChatThread,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'chatRef': _model.newChatThread,
                              },
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You must select at least one other user to start a chat.',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 3000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      text: widget.chatRef != null ? 'concluir' : 'Adcionar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
