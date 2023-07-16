// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

String beautifiedDate(DateTime time) {
  return "${withZero(time.day)}-${withZero(time.month)}-${withZero(time.year)}";
}

String beautifiedDateWithTime(DateTime time) {
  return "${withZero(time.year)}-"
      "${withZero(time.month)}-"
      "${withZero(time.day)}  at ${DateFormat('hh:mm').format(time)}";
}

String rangeWithYearAndMonth(DateTime first, DateTime? second) {
  final String current =
      second == null ? "Ongoing" : "${monthAbbr(second.month)} ${second.year}";

  return "${monthAbbr(first.month)} ${first.year} - $current";
}

String detailedDate(DateTime time) {
  return "${month(time.month)} ${withZero(time.day)}, ${time.year}";
}

String differenceBetween(DateTime date) {
  final DateTime today = DateTime.now();

  final Duration diff = date.difference(today);

  final int dayz = diff.inDays;
  final int hrs = diff.inHours;
  final int minutes = diff.inMinutes;

  if (diff.inSeconds.abs() < 60) {
    return "now";
  }
  if (minutes.abs() < 60) {
    return "${minutes.abs()} min";
  }
  if (hrs.abs() < 24) {
    return "${hrs.abs()} ${hrs.abs() > 1 ? "hrs" : "hr"}";
  }
  if (dayz.abs() < 31) {
    return "${dayz.abs()} ${dayz.abs() > 1 ? "d" : "d"}";
  }

  return beautifiedDate(date);
}

String month(int mon) {
  switch (mon) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
    default:
      return "";
  }
}

/// YYYY-MM-DD
String formattedDate(DateTime date) {
  return "${date.year}-${withZero(date.month)}-${withZero(date.day)}";
}

String monthAbbr(int mon) {
  switch (mon) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5:
      return "May";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";
    case 9:
      return "Sept";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
    default:
      return "";
  }
}

String formattedTime(DateTime time) {
  return "${withZero(time.hour)}:${withZero(time.minute)}";
}

String day(int month) {
  switch (month) {
    case 1:
      return "Mon";
    case 2:
      return "Tue";
    case 3:
      return "Wed";
    case 4:
      return "Thu";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    case 7:
      return "Sun";
    default:
      return "";
  }
}

String withZero(int value) {
  return value < 10 ? "0$value" : "$value";
}
