import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UiConstants {
  static const String emptyString = '';
  static const String exercise = 'exercise';
  static const String weight = 'weight';
  static const String sets = 'sets';
  static const String reps = 'reps';

  static double topBarElevation = 5;

  static const RoundedRectangleBorder topBarRounding =
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)));

  static IconButton topBarBackButton(Function() onPressed) =>
      IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 30));

  static EdgeInsets spacer({double left = 0, double right = 0, double top = 0, double bottom = 0}) =>
      EdgeInsets.fromLTRB(left, top, right, bottom);

  static BorderRadius roundedCorners = BorderRadius.circular(25);

  // TODO: Move to its own file?
  // Dates

  static int getDayFromTimestamp(Timestamp timestamp) => timestamp.toDate().day;
  static int getMonthFromTimestamp(Timestamp timestamp) => timestamp.toDate().month;
  static int getYearFromTimestamp(Timestamp timestamp) => timestamp.toDate().year;
  static String getDayOfWeekFromTimestamp(Timestamp timestamp, {bool isForDate = false}) {
    DateTime dateTime = timestamp.toDate();
    final daysOfTheWeekMap = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday',
    };
    if (isForDate) {
      DateTime now = DateTime.now();
      print('called');
      if (dateTime.day == now.day && dateTime.month == now.month && dateTime.year == dateTime.year) {
        return 'Today';
      }
      return daysOfTheWeekMap[timestamp.toDate().weekday] ?? emptyString;
    }
    return daysOfTheWeekMap[timestamp.toDate().weekday] ?? emptyString;
  }

  static bool isWithinCurrentWeek(Timestamp timestamp) {
    DateTime now = DateTime.now();
    int mondayOffset = now.weekday;
    DateTime previous = now.subtract(Duration(days: mondayOffset));
    if (timestamp.toDate().isAfter(previous) && timestamp.toDate().isBefore(now)) {
      return true;
    }
    return false;
  }

  static String dateFormatter(Timestamp timestamp) {
    int day = getDayFromTimestamp(timestamp);
    int month = getMonthFromTimestamp(timestamp);
    int year = getYearFromTimestamp(timestamp);

    return '$month/$day/$year';
  }
}
