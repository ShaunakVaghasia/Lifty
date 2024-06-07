import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lifty/app/theme/ui_constants.dart';

class DateHelper {
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
      if (dateTime.day == now.day && dateTime.month == now.month && dateTime.year == dateTime.year) {
        return 'Today';
      }
      return daysOfTheWeekMap[timestamp.toDate().weekday] ?? UiConstants.emptyString;
    }
    return daysOfTheWeekMap[timestamp.toDate().weekday] ?? UiConstants.emptyString;
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
