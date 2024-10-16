import '/components/perfil/edit_profil/edit_profil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'auth_edit_perfil_model.dart';
export 'auth_edit_perfil_model.dart';

class AuthEditPerfilWidget extends StatefulWidget {
  const AuthEditPerfilWidget({super.key});

  @override
  State<AuthEditPerfilWidget> createState() => _AuthEditPerfilWidgetState();
}

class _AuthEditPerfilWidgetState extends State<AuthEditPerfilWidget> {
  late AuthEditPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthEditPerfilModel());
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
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 770.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.editProfilModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: EditProfilWidget(
                      title: 'Editar Perfil',
                      confirmButtonText: 'Save Changes',
                      navigateAction: () async {
                        context.safePop();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
