extension DateHelper on DateTime {
  bool isSameDate(DateTime? other) {
    if (other != null) {
      return year == other.year && month == other.month && day == other.day;
    } else {
      return false;
    }
  }

  bool isToday() {
    final now = DateTime.now();
    //  return isSameDate(now);
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}
