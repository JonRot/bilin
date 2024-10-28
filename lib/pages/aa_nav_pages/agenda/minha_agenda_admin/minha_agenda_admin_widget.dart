import '/backend/backend.dart';
import '/components/dashboard/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'minha_agenda_admin_model.dart';
export 'minha_agenda_admin_model.dart';

class MinhaAgendaAdminWidget extends StatefulWidget {
  const MinhaAgendaAdminWidget({super.key});

  @override
  State<MinhaAgendaAdminWidget> createState() => _MinhaAgendaAdminWidgetState();
}

class _MinhaAgendaAdminWidgetState extends State<MinhaAgendaAdminWidget> {
  late MinhaAgendaAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinhaAgendaAdminModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Agenda',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Plus Jakarta Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<AppointmentsRecord>>(
                  stream: queryAppointmentsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const Center(
                        child: SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: SpinKitPulse(
                            color: Color(0x6C57636C),
                            size: 30.0,
                          ),
                        ),
                      );
                    }
                    List<AppointmentsRecord>
                        recurrenceCalendarAppointmentsRecordList =
                        snapshot.data!;

                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.RecurrenceCalendar(
                        width: double.infinity,
                        height: double.infinity,
                        color: FlutterFlowTheme.of(context).primary,
                        isWebFullView: false,
                        appointments: recurrenceCalendarAppointmentsRecordList,
                      ),
                    );
                  },
                ),
              ),
            ].addToEnd(const SizedBox(height: 63.0)),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: const BoxDecoration(),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const Hero(
                  tag: 'Nav',
                  transitionOnUserGestures: true,
                  child: Material(
                    color: Colors.transparent,
                    child: NavBarWidget(
                      navSelected: 2,
                      navHidden: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
