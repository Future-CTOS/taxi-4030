class DateTimeUtils {
  static String getDateTime(String? dateTime) {
    if (dateTime == null) {
      return '-';
    } else {
      String year = DateTime.parse(dateTime).year.toString();
      String month = DateTime.parse(dateTime).month.toString();
      String day = DateTime.parse(dateTime).day.toString();
      return '$year-$month-$day';
    }
  }
}
