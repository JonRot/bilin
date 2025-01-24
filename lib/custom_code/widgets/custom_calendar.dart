// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart'; // Required for CupertinoDatePicker

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime selectedTime;

  @override
  void initState() {
    super.initState();

    // Adjust initial time to align with the minute interval
    final now = DateTime.now();
    final int roundedMinutes = (now.minute ~/ 15) * 15;
    selectedTime = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      roundedMinutes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height ??
          300.0, // Use widget.height if provided, otherwise default to 300.0
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time, // Ensure the mode is defined
        initialDateTime: selectedTime,
        minuteInterval: 15, // Ensures 15-minute increments
        onDateTimeChanged: (DateTime newTime) {
          setState(() {
            selectedTime = newTime;
            FFAppState().update(() {
              FFAppState().time = selectedTime; // Use selectedTime directly
            });
          });
        },
        use24hFormat: true, // Enables 24-hour format
      ),
    );
  }
}
