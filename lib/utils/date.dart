import 'package:intl/intl.dart';

class DateFunctions{

 static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}