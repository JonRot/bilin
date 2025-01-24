import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'disponibilidades_b_t_n_model.dart';
export 'disponibilidades_b_t_n_model.dart';

class DisponibilidadesBTNWidget extends StatefulWidget {
  const DisponibilidadesBTNWidget({
    super.key,
    required this.num,
  });

  final int? num;

  @override
  State<DisponibilidadesBTNWidget> createState() =>
      _DisponibilidadesBTNWidgetState();
}

class _DisponibilidadesBTNWidgetState extends State<DisponibilidadesBTNWidget> {
  late DisponibilidadesBTNModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisponibilidadesBTNModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 48.0,
      ),
      decoration: BoxDecoration(
        color: widget.num != 0
            ? ((Theme.of(context).brightness == Brightness.dark) == true
                ? FlutterFlowTheme.of(context).warning
                : FlutterFlowTheme.of(context).primary)
            : FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 6.0, 0.0),
              child: Icon(
                Icons.event_available_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 12.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'z6cz0jzi' /* Dispo. Teachers */,
                ),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            if (widget.num != 0)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.num?.toString(),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
