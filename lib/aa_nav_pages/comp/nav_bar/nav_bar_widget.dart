import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    int? navSelected,
    bool? navHidden,
  })  : navSelected = navSelected ?? 1,
        navHidden = navHidden ?? false;

  final int navSelected;
  final bool navHidden;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
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
      child: Container(
        height: 90.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          shape: BoxShape.rectangle,
        ),
        alignment: const AlignmentDirectional(0.0, -1.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
          child: Stack(
            alignment: const AlignmentDirectional(0.0, -1.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 14.0,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0x962F2F2F)
                                  : const Color(0xA3D0D0D0),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed('MainDashboard');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Builder(
                              builder: (context) {
                                if (valueOrDefault<bool>(
                                  widget.navSelected == 1,
                                  false,
                                )) {
                                  return Icon(
                                    Icons.house_sharp,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? (widget.navSelected == 1
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText)
                                        : (widget.navSelected == 1
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : const Color(0xB057636C)),
                                    size: 24.0,
                                  );
                                } else {
                                  return Icon(
                                    Icons.house_outlined,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? (widget.navSelected == 1
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText)
                                        : (widget.navSelected == 1
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : const Color(0xB057636C)),
                                    size: 24.0,
                                  );
                                }
                              },
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'dt4arzsf' /* Home */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? (widget.navSelected == 1
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText)
                                        : (widget.navSelected == 1
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : const Color(0xB057636C)),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if ((currentUserDocument?.role == Role.Admin) ||
                                (currentUserDocument?.role ==
                                    Role.SuperAdmin)) {
                              context.pushNamed('chat_mainAdmin');
                            } else {
                              if ((currentUserDocument?.role == Role.Teacher) ||
                                  (currentUserDocument?.role == Role.Parent)) {
                                context.pushNamed('chat_main');
                              }
                            }
                          },
                          child: SizedBox(
                            width: 61.0,
                            height: 44.0,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      if ((currentUserDocument?.role ==
                                              Role.SuperAdmin) ||
                                          (currentUserDocument?.role ==
                                              Role.Admin)) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.goNamed('chat_mainAdmin');
                                          },
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        if (widget
                                                                .navSelected ==
                                                            3) {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: SizedBox(
                                                              width: 24.0,
                                                              height: 24.0,
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .chat_bubble,
                                                                      color: (Theme.of(context).brightness == Brightness.dark) ==
                                                                              true
                                                                          ? (widget.navSelected == 3
                                                                              ? Colors
                                                                                  .white
                                                                              : FlutterFlowTheme.of(context)
                                                                                  .secondaryText)
                                                                          : (widget.navSelected == 3
                                                                              ? FlutterFlowTheme.of(context).secondaryText
                                                                              : const Color(0xB057636C)),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Icon(
                                                            Icons
                                                                .chat_bubble_outline,
                                                            color: (Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark) ==
                                                                    true
                                                                ? (widget
                                                                            .navSelected ==
                                                                        3
                                                                    ? Colors
                                                                        .white
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText)
                                                                : (widget.navSelected ==
                                                                        3
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText
                                                                    : const Color(
                                                                        0xB057636C)),
                                                            size: 24.0,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7onbq2zt' /* Mensagens */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: (Theme.of(context).brightness ==
                                                                            Brightness
                                                                                .dark) ==
                                                                        true
                                                                    ? (widget.navSelected ==
                                                                            3
                                                                        ? Colors
                                                                            .white
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryText)
                                                                    : (widget.navSelected ==
                                                                            3
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryText
                                                                        : const Color(
                                                                            0xB057636C)),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Stack(
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.goNamed('chat_main');
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (widget.navSelected ==
                                                          3) {
                                                        return Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: SizedBox(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            child: Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .chat_bubble,
                                                                    color: (Theme.of(context).brightness == Brightness.dark) ==
                                                                            true
                                                                        ? (widget.navSelected ==
                                                                                3
                                                                            ? Colors
                                                                                .white
                                                                            : FlutterFlowTheme.of(context)
                                                                                .secondaryText)
                                                                        : (widget.navSelected ==
                                                                                3
                                                                            ? FlutterFlowTheme.of(context).secondaryText
                                                                            : const Color(0xB057636C)),
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Icon(
                                                          Icons
                                                              .chat_bubble_outline,
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark) ==
                                                                  true
                                                              ? (widget.navSelected == 3
                                                                  ? Colors.white
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText)
                                                              : (widget.navSelected ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText
                                                                  : const Color(
                                                                      0xB057636C)),
                                                          size: 24.0,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '70x8a6is' /* Mensagens */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark) ==
                                                                  true
                                                              ? (widget.navSelected == 3
                                                                  ? Colors.white
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText)
                                                              : (widget.navSelected ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText
                                                                  : const Color(
                                                                      0xB057636C)),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, -2.0),
                                        child: FutureBuilder<List<ChatsRecord>>(
                                          future: queryChatsRecordOnce(
                                            queryBuilder: (chatsRecord) =>
                                                chatsRecord
                                                    .where(
                                                      'users',
                                                      arrayContains:
                                                          currentUserReference,
                                                    )
                                                    .orderBy(
                                                        'last_message_sent_by',
                                                        descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: SizedBox(
                                                    width: 15.0,
                                                    height: 15.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChatsRecord>
                                                badgeChatsRecordList =
                                                snapshot.data!;

                                            return badges.Badge(
                                              badgeContent: Text(
                                                badgeChatsRecordList
                                                    .where((e) => !e
                                                        .lastMessageSeenBy
                                                        .contains(
                                                            currentUserReference))
                                                    .toList()
                                                    .length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              showBadge: true,
                                              shape: badges.BadgeShape.circle,
                                              badgeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              elevation: 2.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 5.0, 5.0, 5.0),
                                              position:
                                                  badges.BadgePosition.topEnd(),
                                              animationType: badges
                                                  .BadgeAnimationType.scale,
                                              toAnimate: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed('auth_Perfil');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Builder(
                              builder: (context) {
                                if (widget.navSelected == 4) {
                                  return Icon(
                                    Icons.person,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? (widget.navSelected == 4
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText)
                                        : (widget.navSelected == 4
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : const Color(0xB057636C)),
                                    size: 24.0,
                                  );
                                } else {
                                  return Icon(
                                    Icons.person_outlined,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? (widget.navSelected == 4
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText)
                                        : (widget.navSelected == 4
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : const Color(0xB057636C)),
                                    size: 24.0,
                                  );
                                }
                              },
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'qa07o4di' /* Perfil */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? (widget.navSelected == 4
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText)
                                        : (widget.navSelected == 4
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : const Color(0xB057636C)),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
