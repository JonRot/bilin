import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? getNextAppointment(
  DateTime? dateArg,
  String? hourArg,
) {
  // Ensure dateArg and hourArg are not null
  if (dateArg == null || hourArg == null) {
    return null; // Return null if any input is invalid
  }

  // Split the hourArg into hours and minutes
  final hourParts = hourArg.split(':');

  // Ensure hourArg is correctly formatted as HH:mm
  if (hourParts.length != 2) {
    return null; // Return null if the format is incorrect
  }

  // Parse the hours and minutes from the string
  final hour = int.tryParse(hourParts[0]);
  final minute = int.tryParse(hourParts[1]);

  // Ensure both hour and minute are valid integers
  if (hour == null || minute == null) {
    return null; // Return null if parsing fails
  }

  // Return a new DateTime object combining dateArg with hourArg
  return DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
}

bool searchResultChat(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

String formatDateTimeChat(DateTime lastMessageTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));
  final oneWeekAgo = today.subtract(Duration(days: 7));

  // Check if the last message is from today (only show time)
  if (lastMessageTime.year == today.year &&
      lastMessageTime.month == today.month &&
      lastMessageTime.day == today.day) {
    return DateFormat('H:mm').format(lastMessageTime);
  }

  // Check if the last message is from yesterday (show "Ontem, H:mm")
  else if (lastMessageTime.year == yesterday.year &&
      lastMessageTime.month == yesterday.month &&
      lastMessageTime.day == yesterday.day) {
    return 'Ontem, ${DateFormat('H:mm').format(lastMessageTime)}';
  }

  // Check if the last message is within the last week (before yesterday)
  else if (lastMessageTime.isAfter(oneWeekAgo)) {
    // Show abbreviated day name in Portuguese (e.g., "Seg" for "Segunda-feira")
    return DateFormat('E', 'pt_BR').format(lastMessageTime) +
        ', ${DateFormat('H:mm').format(lastMessageTime)}';
  }

  // Otherwise, show the date (d/M H:mm)
  else {
    return DateFormat('d/M H:mm').format(lastMessageTime);
  }
}

String? generateRecurrenceRule(bool appointmentRepeat) {
  if (appointmentRepeat) {
    // Indefinite daily recurrence
    return 'FREQ=WEEKLY;INTERVAL=1';
  } else {
    // Stop recurrence by returning an empty string or null
    return null;
  }
}
