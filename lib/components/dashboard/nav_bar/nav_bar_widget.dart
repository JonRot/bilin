import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    context.watch<FFAppState>();

    return Stack(
      alignment: const AlignmentDirectional(0.0, 1.0),
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: 65.0,
            decoration: const BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
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
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            (Theme.of(context).brightness == Brightness.dark) ==
                                    true
                                ? const Color(0x9214181B)
                                : const Color(0xCCA3A3A3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'MainDashboard',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
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
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : const Color(0xB057636C)),
                              size: 24.0,
                            );
                          }
                        },
                      ),
                      Text(
                        'Home',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Outfit',
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark) ==
                                      true
                                  ? (widget.navSelected == 1
                                      ? Colors.white
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText)
                                  : (widget.navSelected == 1
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : const Color(0xB057636C)),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Builder(
                    builder: (context) {
                      if ((currentUserDocument?.role == Role.Admin) ||
                          (currentUserDocument?.role == Role.SuperAdmin)) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MinhaAgendaAdmin',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.navSelected == 2) {
                                    return Icon(
                                      Icons.calendar_month,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : const Color(0xB057636C)),
                                      size: 24.0,
                                    );
                                  } else {
                                    return Icon(
                                      Icons.calendar_today_outlined,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      size: 24.0,
                                    );
                                  }
                                },
                              ),
                              Text(
                                'Agenda',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        );
                      } else if (currentUserDocument?.role == Role.Teacher) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MinhaAgendaTeacher',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.navSelected == 2) {
                                    return Icon(
                                      Icons.calendar_month,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      size: 24.0,
                                    );
                                  } else {
                                    return Icon(
                                      Icons.calendar_today_outlined,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      size: 24.0,
                                    );
                                  }
                                },
                              ),
                              Text(
                                'Agenda',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MinhaAgendaPais',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.navSelected == 2) {
                                    return Icon(
                                      Icons.calendar_month,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      size: 24.0,
                                    );
                                  } else {
                                    return Icon(
                                      Icons.calendar_today_outlined,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 2
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      size: 24.0,
                                    );
                                  }
                                },
                              ),
                              Text(
                                'Agenda',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? (widget.navSelected == 3
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText)
                                          : (widget.navSelected == 3
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : const Color(0xB057636C)),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Stack(
                alignment: const AlignmentDirectional(0.0, 1.0),
                children: [
                  Builder(
                    builder: (context) {
                      if ((currentUserDocument?.role == Role.SuperAdmin) ||
                          (currentUserDocument?.role == Role.Admin)) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(
                                'chat_mainAdmin',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (widget.navSelected == 3) {
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: SizedBox(
                                          width: 24.0,
                                          height: 24.0,
                                          child: Stack(
                                            alignment:
                                                const AlignmentDirectional(1.0, -1.0),
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.chat_bubble,
                                                  color: (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness
                                                                  .dark) ==
                                                          true
                                                      ? (widget.navSelected ==
                                                              3
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText)
                                                      : (widget.navSelected ==
                                                              3
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
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
                                        Icons.chat_bubble_outline,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? (widget.navSelected == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText)
                                            : (widget.navSelected == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : const Color(0xB057636C)),
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                                Text(
                                  'Mensagens',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? (widget.navSelected == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText)
                                            : (widget.navSelected == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : const Color(0xB057636C)),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(
                                'chat_main',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (widget.navSelected == 3) {
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: SizedBox(
                                          width: 24.0,
                                          height: 24.0,
                                          child: Stack(
                                            alignment:
                                                const AlignmentDirectional(1.0, -1.0),
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.chat_bubble,
                                                  color: (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness
                                                                  .dark) ==
                                                          true
                                                      ? (widget.navSelected ==
                                                              3
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText)
                                                      : (widget.navSelected ==
                                                              3
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
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
                                        Icons.chat_bubble_outline,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? (widget.navSelected == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText)
                                            : (widget.navSelected == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : const Color(0xB057636C)),
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                                Text(
                                  'Mensagens',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? (widget.navSelected == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText)
                                            : (widget.navSelected == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : const Color(0xB057636C)),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  if (FFAppState().messageFocusColor)
                    Align(
                      alignment: const AlignmentDirectional(1.0, -0.5),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'auth_Perfil',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
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
                        'Perfil',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Outfit',
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark) ==
                                      true
                                  ? (widget.navSelected == 4
                                      ? Colors.white
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText)
                                  : (widget.navSelected == 4
                                      ? FlutterFlowTheme.of(context).primaryText
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
    );
  }
}
