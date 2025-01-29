

import 'package:attadence_app/main.dart';
import 'package:intl/intl.dart';


//mangil 
void setDataTime(Function(String,String,String) onDateTimeset) {
  var dateNow = DateTime.now();
  var dateFormat = DateFormat('dd mm yyyy');
  var dateTime = DateFormat('hh:mm:ss');

  String date = dateFormat.format(dateNow);
  String time = dateTime.format(dateNow);
  String currentDate = '$date | $time';

  //set tanggal, waktu da
  onDateTimeset(date, time, currentDate);
}
 //buat var penampung dari data 
void setAttendStatus(Function(String)onStatusSet) {
  var dateNow = DateTime.now();
  var hour = int.parse(DateFormat('hh').format(dateNow)); //int.parse = ngubah int jadi string
  var minute = int.parse(DateFormat('mm').format(dateNow)); 

  String attendanceStatus;
  if (hour <= 7 || (hour == 7 && minute == 00 )){ // jam 7 kurang atau jam 07.00 pas masuknya attend
    attendanceStatus = 'Attend'; 
  } else if (hour > 7 && hour >= 01) { //jam 7 lebih atau 7.01 ke atas di anggap late
    attendanceStatus = 'Late';
  } else {
    attendanceStatus = "Absent"; //kalo ga masuk maka akan keluar Absent
  }
onStatusSet(attendanceStatus);
}