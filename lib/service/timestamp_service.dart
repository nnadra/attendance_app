

import 'package:intl/intl.dart';

void setDataTime(Function(String,String, String) onDateTimeset) {
  var dateNow = DateTime.now();
  var dateFormat = DateFormat('dd mm yyyy');
  var dateTime = DateFormat('hh:mm:ss');

  String date = dateFormat.format(dateNow);
  String time = dateTime.format(dateNow);
  String currentDate = '$date | $time';

  onDateTimeset(date, time, currentDate);
}