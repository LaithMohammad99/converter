import 'package:intl/intl.dart';

class DateFunctions{
  int index=0;

 static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}