import 'package:intl/intl.dart';

class DateHelper {
  static String convertDate(String data) {
    var parsedDate = DateTime.parse(data);
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return dateFormat.format(parsedDate);
  }

  static String getWeekDay(String data) {
    var parsedDate = DateTime.parse(data);
    DateFormat dateFormat = DateFormat.EEEE();

    return dateFormat.format(parsedDate);
  }
}
