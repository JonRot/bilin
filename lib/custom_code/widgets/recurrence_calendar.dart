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
  CalendarView _view = CalendarView.month; // Default set to Month view
  CalendarView? _previousView;
  DateTime? _selectedDate;

  @override
  void initState() {
    _calendarController.view = CalendarView.month; // Set the default view here
    _dataSource = _AppointmentDataSource(
        widget.appointments, widget.color); // Pass color to data source
    super.initState();
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
        _previousView = _calendarController.view;
        _selectedDate = details.date;
        _calendarController.view = CalendarView.day;
        if (details.date != null) {
          _calendarController.displayDate = details.date;
        }
      });
    }
  }

  void _goBackToPreviousView() {
    setState(() {
      if (_previousView != null) {
        _calendarController.view = _previousView!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3CD6B), // Yellow header background
        title: const Text(
          'Agenda',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: _getCalendar(),
          ),
        ],
      ),
    );
  }

  SfCalendar _getCalendar() {
    return SfCalendar(
      controller: _calendarController,
      allowedViews: const [
        CalendarView.workWeek,
        CalendarView.month,
      ],
      onTap: _onCalendarTapped,
      todayHighlightColor:
          const Color(0xFFF3CD6B), // Yellow highlight for today
      specialRegions: _getSpecialRegions(),
      monthViewSettings: MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        showAgenda: false,
        dayFormat: 'EEE', // Show short day names
        numberOfWeeksInView: 5,
        monthCellStyle: MonthCellStyle(
          todayBackgroundColor: Colors.transparent, // Remove box highlight
          trailingDatesBackgroundColor: Colors.white,
          leadingDatesBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(
            color: Colors.black,
          ),
          trailingDatesTextStyle: const TextStyle(
            color: Colors.grey,
          ),
          leadingDatesTextStyle: const TextStyle(
            color: Colors.grey,
          ),
          todayTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
      timeSlotViewSettings: TimeSlotViewSettings(
        startHour: 8,
        endHour: 19,
        timeIntervalHeight: 50,
      ),
      headerStyle: const CalendarHeaderStyle(
        textAlign: TextAlign.center,
        backgroundColor: Colors.white,
      ),
      selectionDecoration: const BoxDecoration(),
      cellEndPadding: 5,
      dataSource: _dataSource,
    );
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
      final recurrenceRule = record.recurrenceRule;
      final bool isRepeat = record.appointmentRepeat ?? true;
      return Appointment(
        startTime: record.appointmentDate ?? DateTime.now(),
        endTime:
            (record.appointmentDate ?? DateTime.now()).add(Duration(hours: 1)),
        subject: record.subject ?? 'No Subject',
        color: color,
        recurrenceRule: isRepeat ? recurrenceRule : null,
      );
    }).toList();
  }
}
