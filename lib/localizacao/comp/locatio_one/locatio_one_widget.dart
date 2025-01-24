import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/perfil_login_criar/comp/location_delete/location_delete_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'locatio_one_model.dart';
export 'locatio_one_model.dart';

class LocatioOneWidget extends StatefulWidget {
  const LocatioOneWidget({
    super.key,
    required this.cidadeDoc,
    bool? isDefault,
  }) : isDefault = isDefault ?? false;

  final CidadeRecord? cidadeDoc;
  final bool isDefault;

  @override
  State<LocatioOneWidget> createState() => _LocatioOneWidgetState();
}

class _LocatioOneWidgetState extends State<LocatioOneWidget>
    with TickerProviderStateMixin {
  late LocatioOneModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocatioOneModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 4.0, 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.cidadeDoc?.titulo,
                            'Endereço',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        if (widget.isDefault == true)
                          Icon(
                            Icons.star_border,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation']!),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        AutoSizeText(
                          valueOrDefault<String>(
                            widget.cidadeDoc != null
                                ? valueOrDefault<String>(
                                    widget.cidadeDoc?.enderecoCompleto,
                                    'endereço endereço endereço endereço endereço endereço endereço',
                                  )
                                : '',
                            'endereço',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFADADAD),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.cidadeDoc != null)
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: FlutterFlowIconButton(
                borderRadius: 0.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.keyboard_control_sharp,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: LocationDeleteWidget(
                          cidadeDoc: widget.cidadeDoc!,
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
              ),
            ),
        ],
      ),
    );
  }
}
