import 'package:intl/intl.dart';

import '../constants/strings.dart';
import 'helper.dart';

class DateTimeHelper {
  static const String dayFormat = 'EEEE dd';
  static const String dateFormat = 'MM/dd/yyyy';
  static const String timeFormat = 'hh:mm a';
  static const String dateTimeFormat = 'MM/dd/yyyy hh:mm a';

  static String? formatDate(String? text, {String? format}) {
    String? formatDate;

    try {
      if (text != null) {
        final DateFormat formatter = DateFormat(format ?? dateFormat);
        DateTime? dateTime = convertToDateTime(text);
        if (dateTime != null) {
          formatDate = formatter.format(dateTime);
        }
      }
    } catch (e) {
      appPrint("formatDateToday error: $e");
    }
    return formatDate;
  }

  static DateTime? dateFromTextField(String? text, {String? format}) {
    DateTime? formatDate;

    try {
      if (text != null) {
        formatDate = DateFormat(format ?? dateFormat).parse(text);
      }
    } catch (e) {
      appPrint("formatDateToday error: $e");
    }
    return formatDate;
  }

  static String? formatTime(String? text, {String? format}) {
    String? formatDate;

    try {
      if (text != null) {
        final DateFormat formatter = DateFormat(format ?? timeFormat);
        DateTime? dateTime = convertToDateTime(text);
        if (dateTime != null) {
          formatDate = formatter.format(dateTime);
        }
      }
    } catch (e) {
      appPrint("formatDateToday error: $e");
    }
    return formatDate;
  }

  static DateTime? convertToDateTime(String? text) {
    DateTime? dateTime;
    if (text != null && text.isNotEmpty) {
      dateTime = DateTime.tryParse(text);
    }
    return dateTime;
  }

  static String greetings() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return AppStrings.goodMorning;
    } else if (hour < 17) {
      return AppStrings.goodAfternoon;
    }
    return AppStrings.goodEvening;
  }
}
