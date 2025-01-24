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
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool searchResultChat(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

String dateTimeToStringTime(DateTime lastMessageTime) {
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

int? totalMinusNumber(
  int? total,
  int? number,
) {
  // I need a output that shows the "total" minus the "number"
  if (total != null && number != null) {
    return total - number;
  } else {
    return null;
  }
}

LatLng stringsToLatLng(
  String lat,
  String lng,
) {
  //  have two varibles that use a API call to a lat and long strings example:    "lat": "-26.27897",   "lng": "-48.86575",  and I want to return a LatLng
  // Parse the lat and lng strings to double values
  final double latitude = double.parse(lat);
  final double longitude = double.parse(lng);

  // Return a new LatLng object with the parsed values
  return LatLng(latitude, longitude);
}

String? getAge(DateTime? date) {
  // Based on a DD/MM/YYYY date format, create a output that calculates the year to date
  // Check if the input date is not null
  if (date != null) {
    // Get the current date
    final now = DateTime.now();

    // Calculate the age based on the year difference
    final age = now.year - date.year;

    // Return the age as a string
    return age.toString();
  } else {
    // Return null if the input date is null
    return null;
  }
}

List<AvailabilityStruct>? initialAvailability() {
  // generate 7 random array for each day of the week
  final List<AvailabilityStruct> availability = [];

  final List<String> daysofWeek = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta'
  ];

  for (final day in daysofWeek) {
    // final startTime = DateTime(2023, 1, daysOfWeek.indexOf(day) + 2, 0, 0);
    // final endTime = DateTime(2023, 1, daysOfWeek.indexOf(day) + 2, 0, 0);
    availability.add(
        AvailabilityStruct(dayofWeek: day, startTime: null, endTime: null));
  }

  return availability;
}

bool getAvailabileSlotsForTeacherSelect(
  List<BookingsRecord> bookings,
  List<AvailabilityStruct> teacherAvailability,
  List<AvailabilityStruct> studentAvailability,
) {
  // Static date for normalization - Used to anchor all time calculations to the same day
  final staticDate = DateTime(2024, 1, 1);

  // Function to normalize DateTime to static date (ignoring year/month/day)
  DateTime normalizeToStaticDate(DateTime dateTime) {
    return DateTime(staticDate.year, staticDate.month, staticDate.day,
        dateTime.hour, dateTime.minute);
  }

  // Iterate through availability for both teacher and student
  for (final teacherSlot in teacherAvailability) {
    for (final studentSlot in studentAvailability) {
      // Ensure both slots are valid and occur on the same day of the week
      if (teacherSlot.startTime != null &&
          teacherSlot.endTime != null &&
          studentSlot.startTime != null &&
          studentSlot.endTime != null &&
          teacherSlot.dayofWeek.toLowerCase() ==
              studentSlot.dayofWeek.toLowerCase()) {
        // Normalize teacher and student slots to static date
        final teacherStart = normalizeToStaticDate(teacherSlot.startTime!);
        final teacherEnd = normalizeToStaticDate(teacherSlot.endTime!);
        final studentStart = normalizeToStaticDate(studentSlot.startTime!);
        final studentEnd = normalizeToStaticDate(studentSlot.endTime!);

        // Calculate the overlapping time range
        final overlapStart =
            teacherStart.isAfter(studentStart) ? teacherStart : studentStart;
        final overlapEnd =
            teacherEnd.isBefore(studentEnd) ? teacherEnd : studentEnd;

        // Ensure there is a valid overlap between teacher and student
        if (overlapStart.isBefore(overlapEnd)) {
          // Check available 15-minute intervals within the overlap
          var currentTime = overlapStart;
          while (currentTime.isBefore(overlapEnd)) {
            final hour = currentTime.hour;
            final minute = currentTime.minute;

            // Filter for valid morning and afternoon time slots
            final isMorning =
                (hour >= 9 && hour <= 11) && (hour != 11 || minute <= 30);
            final isAfternoon = (hour > 13 || (hour == 13 && minute >= 30)) &&
                (hour <= 17) &&
                (hour != 17 || minute <= 30);

            if (isMorning || isAfternoon) {
              // Check for conflicts with existing bookings
              final normalizedCurrent = normalizeToStaticDate(currentTime);
              final overlapsWithBooking = bookings.any((booking) {
                if (!booking.bookingActive) return false;

                final bookingDay = booking.bookingDayOfWeek.toLowerCase();
                final bookingStart =
                    normalizeToStaticDate(booking.bookingTime!);
                final bookingEnd = bookingStart
                    .add(const Duration(hours: 1)); // Assuming 1-hour booking

                // Verify if booking conflicts with the current slot
                return bookingDay == teacherSlot.dayofWeek.toLowerCase() &&
                    normalizedCurrent.isAfter(
                        bookingStart.subtract(const Duration(minutes: 15))) &&
                    normalizedCurrent
                        .isBefore(bookingEnd.add(const Duration(minutes: 15)));
              });

              // Skip the slot if it overlaps with any booking
              if (overlapsWithBooking) {
                currentTime = currentTime.add(Duration(minutes: 15));
                continue;
              }

              // Return true if a valid slot is found
              return true;
            }

            // Move to the next 15-minute interval
            currentTime = currentTime.add(Duration(minutes: 15));
          }
        }
      }
    }
  }

  // Return false if no valid slots are found
  return false;
}

DateTime? stringTimeToDateTime(String? times) {
  // strings that looks like 09:00 or 23:00 convert to daytime
  if (times == null) {
    return null;
  }

  List<String> parts = times.split(':');
  if (parts.length != 2) {
    return null;
  }

  int hour = int.tryParse(parts[0]) ?? 0;
  int minute = int.tryParse(parts[1]) ?? 0;

  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
    return null;
  }

  return DateTime(1, 1, 1, hour, minute);
}

bool? getAvailabilitySlotsBetweenAboveBool(
  List<DateTime>? bookedTimes,
  String? getWidgetTime,
) {
  // Check if the input parameters are valid
  if (getWidgetTime == null) {
    return false;
  }
  if (bookedTimes == null || bookedTimes.isEmpty) {
    return true;
  }

  // Sort the bookedTimes to ensure the earliest time is first
  bookedTimes.sort();

  // Parse the widget time string to extract hours and minutes
  List<String> timeParts = getWidgetTime.split(":");
  if (timeParts.length != 2) {
    return false;
  }

  int widgetHour = int.tryParse(timeParts[0]) ?? -1;
  int widgetMinute = int.tryParse(timeParts[1]) ?? -1;
  if (widgetHour < 0 || widgetMinute < 0) {
    return false;
  }

  // Create a DateTime for the widget time using the first booked time's date
  DateTime firstBookedDate = bookedTimes.first;
  DateTime widgetDateTime = DateTime(
    firstBookedDate.year,
    firstBookedDate.month,
    firstBookedDate.day,
    widgetHour,
    widgetMinute,
  );

  // Check if the widget time is earlier than the first booked time
  return widgetDateTime.isBefore(firstBookedDate);
}

List<String>? stringtoListofStrings(String? string) {
  // one string to list of strings format
  if (string == null || string.isEmpty) {
    return null;
  }

  List<String> list = string.split(',');
  return list;
}

List<DateTime>? getAvailabileSlots(
  List<DateTime> bookings,
  String dayOfWeekArg,
  List<AvailabilityStruct> teacherAvailability,
  List<AvailabilityStruct> studentAvailability,
  int? travelTime,
) {
  // Map day names in Portuguese to indices
  final dayOfWeekMap = {
    'Segunda': 'segunda',
    'Terça': 'terça',
    'Quarta': 'quarta',
    'Quinta': 'quinta',
    'Sexta': 'sexta',
  };

  final dayOfWeekPortuguese = dayOfWeekMap[dayOfWeekArg];
  if (dayOfWeekPortuguese == null) {
    throw ArgumentError('Invalid day of week: $dayOfWeekArg');
  }

  // Static date for normalization
  final staticDate = DateTime(2024, 1, 1);

  // Normalize a DateTime to the static date
  DateTime normalizeToStaticDate(DateTime dateTime) {
    return DateTime(staticDate.year, staticDate.month, staticDate.day,
        dateTime.hour, dateTime.minute);
  }

  // Filter teacher and student availability for the specific day
  final matchingTeacherAvailability = teacherAvailability
      .where(
          (a) => a.dayofWeek.toLowerCase() == dayOfWeekPortuguese.toLowerCase())
      .toList();

  final matchingStudentAvailability = studentAvailability
      .where(
          (a) => a.dayofWeek.toLowerCase() == dayOfWeekPortuguese.toLowerCase())
      .toList();

  // If no matching availability exists, return an empty list
  if (matchingTeacherAvailability.isEmpty ||
      matchingStudentAvailability.isEmpty) {
    return [];
  }

  // Generate overlapping time blocks
  List<DateTime> timeBlocks = [];
  DateTime lastAllowedEndTime =
      staticDate.add(const Duration(hours: 23)); // Default large time
  for (final teacherSlot in matchingTeacherAvailability) {
    if (teacherSlot.startTime != null && teacherSlot.endTime != null) {
      for (final studentSlot in matchingStudentAvailability) {
        if (studentSlot.startTime != null && studentSlot.endTime != null) {
          // Normalize start and end times to the static date
          final teacherStart = normalizeToStaticDate(teacherSlot.startTime!);
          final teacherEnd = normalizeToStaticDate(teacherSlot.endTime!);
          final studentStart = normalizeToStaticDate(studentSlot.startTime!);
          final studentEnd = normalizeToStaticDate(studentSlot.endTime!);

          // Determine the actual last allowed end time (1 hour before the earliest end time)
          final overlapEnd =
              teacherEnd.isBefore(studentEnd) ? teacherEnd : studentEnd;
          lastAllowedEndTime = overlapEnd.subtract(const Duration(hours: 0));

          // Calculate the actual overlapping time
          final overlapStart =
              teacherStart.isAfter(studentStart) ? teacherStart : studentStart;

          // Ensure there is a valid overlap
          if (overlapStart.isBefore(overlapEnd)) {
            // Generate 15-minute intervals within the overlap
            var currentTime = overlapStart;
            while (currentTime.isBefore(overlapEnd)) {
              timeBlocks.add(currentTime);
              currentTime = currentTime.add(Duration(minutes: 15));
            }
          }
        }
      }
    }
  }

  // Filter to only show times within 9:00-11:31 and 13:30-17:31
  timeBlocks = timeBlocks.where((time) {
    final hour = time.hour;
    final minute = time.minute;
    final isMorning = (hour >= 9 && hour <= 11) && (hour != 11 || minute <= 30);
    final isAfternoon = (hour > 13 || (hour == 13 && minute >= 30)) &&
        (hour <= 17) &&
        (hour != 17 || minute <= 30);
    return isMorning || isAfternoon;
  }).toList();

  // Filter out slots that conflict with bookings, lack travel time, or exceed the last allowed end time
  final filteredBlocks = timeBlocks.where((timeBlock) {
    for (final booking in bookings) {
      final normalizedBookingStart = normalizeToStaticDate(booking);
      final bookingEnd = normalizedBookingStart.add(Duration(hours: 1));
      final travelBuffer = Duration(minutes: travelTime ?? 0);

      // Block if there's not enough travel time before or after the booking
      if (timeBlock
              .add(Duration(hours: 1))
              .add(travelBuffer)
              .isAfter(normalizedBookingStart) &&
          timeBlock.isBefore(bookingEnd.add(travelBuffer))) {
        return false;
      }
    }

    // Exclude slots that exceed the last allowed end time
    if (timeBlock.add(const Duration(hours: 1)).isAfter(lastAllowedEndTime)) {
      return false;
    }

    return true;
  }).toList();

  return filteredBlocks;
}

int? indexFromWeekDayString(String? daySelected) {
  //  OUTPUT A NUMBER based on the string SEG = 0 TER = 1 QUA = 2 QUI = 3 SEX = 4
  switch (daySelected) {
    case 'SEG':
      return 0;
    case 'TER':
      return 1;
    case 'QUA':
      return 2;
    case 'QUI':
      return 3;
    case 'SEX':
      return 4;
    default:
      return null;
  }
}

int? secondsToMinutes(int? timeDistanceSec) {
  // divide timeDistanceSec with 60 and round it to a full number
  if (timeDistanceSec != null) {
    return (timeDistanceSec / 60).round();
  }
  return null;
}

String? add1hToTime(DateTime? time) {
  // add 1h to the time and output in format like 9:00 or 22:00...
  if (time != null) {
    final newTime = time.add(Duration(hours: 1));
    final formatter = DateFormat('HH:mm');
    return formatter.format(newTime);
  }
  return null;
}

String? intervalsTimes(
  List<DateTime>? bookTimes,
  DateTime? time,
) {
  // use 'time' to find the datetime in 'bookTimes' calculate the interval between the time and the previous time and subtract 1h from the result and format like 55 min or 1:40 min
  if (bookTimes == null || time == null || bookTimes.isEmpty) {
    return null;
  }

  int index = bookTimes.indexOf(time);
  if (index == -1 || index == 0) {
    return null;
  }

  Duration interval =
      time.difference(bookTimes[index - 1]) - Duration(hours: 1);

  if (interval.inHours > 0) {
    return '${interval.inHours}:${(interval.inMinutes % 60).toString().padLeft(2, '0')} min';
  } else {
    return '${interval.inMinutes} min';
  }
}

bool? stringTimeToBool(String? time) {
  // time is a string like 50 min oe 1:30 min if equal or more than 60 min make it true and if empty = false
  if (time == null || time.isEmpty) {
    return false;
  }

  List<String> parts = time.split(':');
  if (parts.length == 1) {
    int minutes = int.parse(parts[0].replaceAll(' min', ''));
    return minutes >= 60;
  } else if (parts.length == 2) {
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1].replaceAll(' min', ''));
    return hours > 0 || minutes >= 60;
  }

  return false;
}

DateTime? nextScheduleTime(DateTime? time) {
  // compare 'time' to current time and if its less of equal to current time add one week.
  if (time == null) {
    return null;
  }

  DateTime currentTime = DateTime.now();
  if (time.isBefore(currentTime) || time.isAtSameMomentAs(currentTime)) {
    return time.add(Duration(days: 7));
  }

  return time;
}

String? simplifyDayString(String? day) {
  // 'Day' is poruguese for Day of week like Segunda, Terça, ... make it a 3 letter all CAPS like SEG, TER, QUA, QUI, SEX
  if (day == 'Segunda') {
    return 'SEG';
  } else if (day == 'Terça') {
    return 'TER';
  } else if (day == 'Quarta') {
    return 'QUA';
  } else if (day == 'Quinta') {
    return 'QUI';
  } else if (day == 'Sexta') {
    return 'SEX';
  } else {
    return day;
  }
}

List<DateTime>? dateTimeRegistrationDates(
  DateTime? createdTime,
  String? scheduledDayOfWeek,
  DateTime? time,
  List<DateTime>? exceptionDays,
) {
  // use 'createdTime' to check the weekly schedule based on the 'sheduleDayOfWeek' with string values of: Segunda or Terça or Quarta or Quinta or Sexta and grab the time from 'time' to the the list of outputs generating all weekly dateTimes from the 'createdTime' to the present day, also excluding all dateTimes that match the date with the date on 'exeptionDays'.
  if (createdTime == null ||
      scheduledDayOfWeek == null ||
      time == null ||
      exceptionDays == null) {
    return null;
  }

  List<DateTime> output = [];

  DateTime now = DateTime.now();
  DateTime currentDateTime = DateTime(
    createdTime.year,
    createdTime.month,
    createdTime.day,
    time.hour,
    time.minute,
  );

  while (currentDateTime.isBefore(now)) {
    if (scheduledDayOfWeek == 'Segunda' && currentDateTime.weekday == 1) {
      if (!exceptionDays.any((exceptionDay) =>
          exceptionDay.year == currentDateTime.year &&
          exceptionDay.month == currentDateTime.month &&
          exceptionDay.day == currentDateTime.day)) {
        output.add(currentDateTime);
      }
    } else if (scheduledDayOfWeek == 'Terça' && currentDateTime.weekday == 2) {
      if (!exceptionDays.any((exceptionDay) =>
          exceptionDay.year == currentDateTime.year &&
          exceptionDay.month == currentDateTime.month &&
          exceptionDay.day == currentDateTime.day)) {
        output.add(currentDateTime);
      }
    } else if (scheduledDayOfWeek == 'Quarta' && currentDateTime.weekday == 3) {
      if (!exceptionDays.any((exceptionDay) =>
          exceptionDay.year == currentDateTime.year &&
          exceptionDay.month == currentDateTime.month &&
          exceptionDay.day == currentDateTime.day)) {
        output.add(currentDateTime);
      }
    } else if (scheduledDayOfWeek == 'Quinta' && currentDateTime.weekday == 4) {
      if (!exceptionDays.any((exceptionDay) =>
          exceptionDay.year == currentDateTime.year &&
          exceptionDay.month == currentDateTime.month &&
          exceptionDay.day == currentDateTime.day)) {
        output.add(currentDateTime);
      }
    } else if (scheduledDayOfWeek == 'Sexta' && currentDateTime.weekday == 5) {
      if (!exceptionDays.any((exceptionDay) =>
          exceptionDay.year == currentDateTime.year &&
          exceptionDay.month == currentDateTime.month &&
          exceptionDay.day == currentDateTime.day)) {
        output.add(currentDateTime);
      }
    }

    currentDateTime = currentDateTime.add(Duration(days: 1));
  }

  return output;
}

String? dateTimeToSimplifyDayString(DateTime? dateTime) {
// grab the day of week from 'dateTime' output to string value of SEG, TER, QUA, QUI, SEX else SEG
  if (dateTime == null) {
    return null;
  }

  switch (dateTime.weekday) {
    case DateTime.monday:
      return 'SEG';
    case DateTime.tuesday:
      return 'TER';
    case DateTime.wednesday:
      return 'QUA';
    case DateTime.thursday:
      return 'QUI';
    case DateTime.friday:
      return 'SEX';
    default:
      return 'SEG';
  }
}

bool? getAvailabilitySlotsBetween(
  List<DateTime>? bookedTimes,
  DateTime? beforeBookedTime,
  String? getWidgetTime,
) {
  // Use 'beforeBookedTime' to find the matching time on 'bookedTimes' and find the next time. If 'getWidgetTime' is in that section, return true; else false. Handle edge cases where 'bookedTimes' is empty or it's the last entry.
  if (beforeBookedTime == null || getWidgetTime == null) {
    return false;
  }

  // Parse the widget time string to extract hours and minutes
  List<String> timeParts = getWidgetTime.split(":");
  if (timeParts.length != 2) {
    return false;
  }

  int widgetHour = int.tryParse(timeParts[0]) ?? -1;
  int widgetMinute = int.tryParse(timeParts[1]) ?? -1;
  if (widgetHour < 0 || widgetMinute < 0) {
    return false;
  }

  DateTime widgetDateTime = DateTime(
    beforeBookedTime.year,
    beforeBookedTime.month,
    beforeBookedTime.day,
    widgetHour,
    widgetMinute,
  );

  // Handle case where bookedTimes is null or empty
  if (bookedTimes == null || bookedTimes.isEmpty) {
    return true;
  }

  bookedTimes.sort();

  for (int i = 0; i < bookedTimes.length; i++) {
    if (bookedTimes[i].isAtSameMomentAs(beforeBookedTime)) {
      DateTime startTime = bookedTimes[i];
      DateTime endTime = (i + 1 < bookedTimes.length)
          ? bookedTimes[i + 1]
          : DateTime(beforeBookedTime.year, beforeBookedTime.month,
              beforeBookedTime.day, 19, 0);

      return widgetDateTime.isAfter(startTime) &&
          widgetDateTime.isBefore(endTime);
    }
  }

  return false;
}

String? organizeListDateTimeByMonth(
  List<DateTime>? dateTimeList,
  DateTime? lastOfMonth,
) {
  // Portuguese month names
  const monthNamesPt = [
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'maio',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro',
  ];

  // Validate inputs
  if (dateTimeList == null || dateTimeList.isEmpty || lastOfMonth == null) {
    return null;
  }

  // Remove duplicates based on both date and time
  List<DateTime> uniqueDates = dateTimeList.toSet().toList();

  // Sort the list in ascending order (date and time combined)
  uniqueDates.sort((a, b) => a.compareTo(b));

  // Find the last occurrence of the specified month and year
  DateTime? lastOccurrenceOfMonth;
  for (DateTime dateTime in uniqueDates) {
    if (dateTime.month == lastOfMonth.month &&
        dateTime.year == lastOfMonth.year) {
      if (lastOccurrenceOfMonth == null ||
          dateTime.isAfter(lastOccurrenceOfMonth)) {
        lastOccurrenceOfMonth = dateTime;
      }
    }
  }

  // Check if the last occurrence matches `lastOfMonth`
  if (lastOccurrenceOfMonth != null &&
      lastOccurrenceOfMonth.year == lastOfMonth.year &&
      lastOccurrenceOfMonth.month == lastOfMonth.month &&
      lastOccurrenceOfMonth.day == lastOfMonth.day &&
      lastOccurrenceOfMonth.hour == lastOfMonth.hour &&
      lastOccurrenceOfMonth.minute == lastOfMonth.minute) {
    return '${monthNamesPt[lastOfMonth.month - 1].capitalize()} de ${lastOfMonth.year}';
  }

  return null;
}

// Extension to capitalize the first letter of a string
extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
