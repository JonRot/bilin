import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/localizacao/comp/locatio_one/locatio_one_widget.dart';
import '/perfil_login_criar/comp/location/location_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'localizacao_lista_model.dart';
export 'localizacao_lista_model.dart';

class LocalizacaoListaWidget extends StatefulWidget {
  const LocalizacaoListaWidget({super.key});

  @override
  State<LocalizacaoListaWidget> createState() => _LocalizacaoListaWidgetState();
}

class _LocalizacaoListaWidgetState extends State<LocalizacaoListaWidget> {
  late LocalizacaoListaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalizacaoListaModel());

    _model.cepTextController ??= TextEditingController();
    _model.cepFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CidadeRecord>>(
      stream: FFAppState().cidade(
        requestFn: () => queryCidadeRecord(
          queryBuilder: (cidadeRecord) => cidadeRecord.where(
            'userRefCidade',
            isEqualTo: currentUserReference,
          ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0x6C57636C),
                  ),
                ),
              ),
            ),
          );
        }
        List<CidadeRecord> localizacaoListaCidadeRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'lonulufh' /* Endereço */,
              ),
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Plus Jakarta Sans',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'wrg376ms' /* Adcione um Endereço: */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.cepTextController,
                            focusNode: _model.cepFocusNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'ip5tkrrz' /* CEP */,
                              ),
                              hintText: FFLocalizations.of(context).getText(
                                'gc9xzd86' /* 12345-123 */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFA4A4A4),
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            minLines: 1,
                            keyboardType: TextInputType.number,
                            validator: _model.cepTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.cepMask],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            buttonSize: 50.0,
                            fillColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              if (_model.cepTextController.text != '') {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                _model.cEPResultAPI = await LatlngAPICall.call(
                                  cEPVar: _model.cepTextController.text,
                                );

                                if ((_model.cEPResultAPI?.succeeded ?? true)) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LocationWidget(
                                          rua: LatlngAPICall.ruaAPI(
                                            (_model.cEPResultAPI?.jsonBody ??
                                                ''),
                                          )!,
                                          bairro: LatlngAPICall.bairroAPI(
                                            (_model.cEPResultAPI?.jsonBody ??
                                                ''),
                                          )!,
                                          cidade: LatlngAPICall.cidadeAPI(
                                            (_model.cEPResultAPI?.jsonBody ??
                                                ''),
                                          )!,
                                          estado: LatlngAPICall.estadoAPI(
                                            (_model.cEPResultAPI?.jsonBody ??
                                                ''),
                                          )!,
                                          cep: LatlngAPICall.cepAPI(
                                            (_model.cEPResultAPI?.jsonBody ??
                                                ''),
                                          )!,
                                          latLng: functions.stringsToLatLng(
                                              LatlngAPICall.latAPI(
                                                (_model.cEPResultAPI
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              LatlngAPICall.lngAPI(
                                                (_model.cEPResultAPI
                                                        ?.jsonBody ??
                                                    ''),
                                              )!),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text('CEP Invalido'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }

                              safeSetState(() {});
                            },
                          ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'q9mid2so' /* Seu Endereço: */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Flexible(
                  child: Builder(
                    builder: (context) {
                      final cidadeView =
                          localizacaoListaCidadeRecordList.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: cidadeView.length,
                        itemBuilder: (context, cidadeViewIndex) {
                          final cidadeViewItem = cidadeView[cidadeViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 12.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        userDefaultLocation:
                                            cidadeViewItem.enderecoCompleto,
                                      ));
                                      FFAppState().clearCidadeCache();
                                    },
                                    child: wrapWithModel(
                                      model: _model.locatioOneModels.getModel(
                                        cidadeViewItem.userRefCidade!.id,
                                        cidadeViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: LocatioOneWidget(
                                        key: Key(
                                          'Keya99_${cidadeViewItem.userRefCidade!.id}',
                                        ),
                                        cidadeDoc: cidadeViewItem,
                                        isDefault: valueOrDefault(
                                                currentUserDocument
                                                    ?.userDefaultLocation,
                                                '') ==
                                            cidadeViewItem.enderecoCompleto,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
