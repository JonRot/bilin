import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'request_parents_title_model.dart';
export 'request_parents_title_model.dart';

class RequestParentsTitleWidget extends StatefulWidget {
  const RequestParentsTitleWidget({
    super.key,
    this.icon,
    this.font,
  });

  final int? icon;
  final int? font;

  @override
  State<RequestParentsTitleWidget> createState() =>
      _RequestParentsTitleWidgetState();
}

class _RequestParentsTitleWidgetState extends State<RequestParentsTitleWidget> {
  late RequestParentsTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestParentsTitleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      height: 48.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FFIcons.kasxas,
              color: FlutterFlowTheme.of(context).primaryText,
              size: widget.icon?.toDouble(),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: AnimatedDefaultTextStyle(
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: widget.font?.toDouble(),
                      letterSpacing: 0.0,
                    ),
                duration: const Duration(milliseconds: 705),
                curve: Curves.easeInOut,
                child: Text(
                  FFLocalizations.of(context).getText(
                    'bc0wbbzb' /* Solicitações de Pais */,
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
