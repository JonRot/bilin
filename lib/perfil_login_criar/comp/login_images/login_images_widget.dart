import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'login_images_model.dart';
export 'login_images_model.dart';

class LoginImagesWidget extends StatefulWidget {
  const LoginImagesWidget({super.key});

  @override
  State<LoginImagesWidget> createState() => _LoginImagesWidgetState();
}

class _LoginImagesWidgetState extends State<LoginImagesWidget> {
  late LoginImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginImagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: 355.0 * (math.pi / 180),
          child: Container(
            width: 160.0,
            height: 160.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x16000000),
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                  spreadRadius: 1.0,
                )
              ],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '2jatalg7' /* De infancia
à Bilingue */
                    ,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
          child: Transform.rotate(
            angle: 8.0 * (math.pi / 180),
            child: Container(
              width: 160.0,
              height: 160.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Color(0x16000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                    spreadRadius: 1.0,
                  )
                ],
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.asset(
                  'assets/images/0t6a0464.JPG',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
