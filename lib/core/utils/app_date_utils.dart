import 'package:intl/intl.dart';

class AppDateUtils {
  const AppDateUtils._();

  static String monthDay(DateTime date) {
    return DateFormat('MM-dd').format(date);
  }

  static String humanDate(DateTime date) {
    return DateFormat('EEEE, dd MMMM yyyy').format(date);
  }
}
