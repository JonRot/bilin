// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets
import 'package:syncfusion_flutter_calendar/calendar.dart'; // Import the Syncfusion calendar package

class RecurrenceCalendar extends StatefulWidget {
  final double? width;
  final double? height;
  final List<AppointmentsRecord> appointments; // Changed to AppointmentsRecord
  final Color color; // Single color instead of a list
  final bool isWebFullView;

  const RecurrenceCalendar({
    Key? key,
    this.width,
    this.height,
    required this.appointments,
    required this.color, // Single color
    required this.isWebFullView,
  }) : super(key: key);

  @override
  RecurrenceCalendarState createState() => RecurrenceCalendarState();
}

class RecurrenceCalendarState extends State<RecurrenceCalendar> {
  final CalendarController _calendarController = CalendarController();
  late _AppointmentDataSource _dataSource;

  @override
  void initState() {
    _calendarController.view = CalendarView.month; // Set the default view here
    _dataSource = _AppointmentDataSource(
        widget.appointments, widget.color); // Pass color to data source
    super.initState();
  }

  void _toggleView() {
    setState(() {
      _calendarController.view = _calendarController.view == CalendarView.month
          ? CalendarView.workWeek
          : CalendarView.month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The calendar placed at the bottom of the stack
          Positioned.fill(
            child: _getCalendar(),
          ),
          // Toggle button positioned on top of the calendar
          Positioned(
            top: -6.0,
            right: 16.0,
            child: IconButton(
              icon: Icon(
                _calendarController.view == CalendarView.month
                    ? Icons.view_week
                    : Icons.calendar_view_month,
                color: Colors.black,
              ),
              onPressed: _toggleView,
            ),
          ),
        ],
      ),
    );
  }

  SfCalendar _getCalendar() {
    return SfCalendar(
      controller: _calendarController,
      view: _calendarController.view ??
          CalendarView.month, // Provide a default if view is null
      onTap: _onCalendarTapped,
      todayHighlightColor:
          const Color(0xFFF3CD6B), // Yellow highlight for today
      specialRegions: _getSpecialRegions(),
      monthViewSettings: const MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        showAgenda: false,
        showTrailingAndLeadingDates: false,
      ),
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 8,
        endHour: 19,
        timeIntervalHeight: 50,
      ),
      viewHeaderStyle: const ViewHeaderStyle(
        backgroundColor: Colors.transparent,
        dayTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      headerStyle: const CalendarHeaderStyle(
        textAlign: TextAlign.center,
        backgroundColor: Colors.white,
      ),
      dataSource: _dataSource,
      selectionDecoration: const BoxDecoration(), // Remove selection outline
    );
  }

  void _onCalendarTapped(CalendarTapDetails details) async {
    if (details.targetElement == CalendarElement.viewHeader ||
        details.targetElement == CalendarElement.header) {
      return;
    }

    // Switch to day view when selecting a date in month or work week view
    if (_calendarController.view == CalendarView.month ||
        _calendarController.view == CalendarView.workWeek) {
      setState(() {
        _calendarController.view = CalendarView.day;
        if (details.date != null) {
          _calendarController.displayDate = details.date;
        }
      });
    }
  }

  List<TimeRegion> _getSpecialRegions() {
    return <TimeRegion>[
      TimeRegion(
        startTime: DateTime(2024, 1, 1, 12, 0), // Start of lunch
        endTime: DateTime(2024, 1, 1, 13, 0), // End of lunch
        recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
        color: const Color.fromARGB(255, 136, 136, 136).withOpacity(0.5),
      ),
    ];
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<AppointmentsRecord> source, Color color) {
    appointments = source.map((record) {
      // Determine the weekday of the start date
      final dayOfWeek = _getDayOfWeek(record.appointmentDate ?? DateTime.now());

      // Create the recurrence rule dynamically based on the weekday
      final recurrenceRule = 'FREQ=WEEKLY;INTERVAL=1;BYDAY=$dayOfWeek';

      return Appointment(
        startTime: record.appointmentDate ?? DateTime.now(),
        endTime: (record.appointmentDate ?? DateTime.now())
            .add(const Duration(hours: 1)),
        subject: record.subject ?? 'No Subject',
        color: color,
        recurrenceRule: recurrenceRule,
      );
    }).toList();
  }

  // Helper function to convert a DateTime weekday to BYDAY string
  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'MO';
      case DateTime.tuesday:
        return 'TU';
      case DateTime.wednesday:
        return 'WE';
      case DateTime.thursday:
        return 'TH';
      case DateTime.friday:
        return 'FR';
      case DateTime.saturday:
        return 'SA';
      case DateTime.sunday:
        return 'SU';
      default:
        return 'MO'; // Default to Monday if somehow the weekday is invalid
    }
  }
}
