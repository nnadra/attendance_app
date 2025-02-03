import 'package:attadence_app/service/location_service.dart';
import 'package:attadence_app/service/timestamp_service.dart';
import 'package:attadence_app/ui/components/app_bar.dart';
import 'package:attadence_app/ui/components/capture_photo.dart';
import 'package:attadence_app/ui/components/header.dart';
import 'package:attadence_app/ui/components/location.dart';
import 'package:attadence_app/ui/components/name_input.dart';
import 'package:attadence_app/ui/components/submit_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile? image;

  const AttendanceScreen({super.key, this.image});
  
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}


class _AttendanceScreenState extends State<AttendanceScreen> {
  XFile? image;
  String addressPlaceholder = '', datePlaceholder = '', timePlaceholder = '', timeStampPlaceholder = '', statusPlaceholder = 'Attend';
  bool isLoading = false;
  final controllerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    handleLocationPermission(context);
    setDataTime((date,time,timeStamp){
      setState(() {
        date = datePlaceholder;
        time = timePlaceholder;
        timeStamp = timeStampPlaceholder;
      });
    });
    setAttendStatus((status){
      setState(() {
        statusPlaceholder = status;
      });
    });
    if (image != null) {
     isLoading = true;
     getGeoLocationPosition(context, (position){
      setState(() {
        isLoading = false;
        getAddressFromLongLat(position, (address) {
          setState(() {
            addressPlaceholder = address;
          });
        });
      });
     });
      
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //u mendapatkan size yg sedang digunakan
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context) ,
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              buildCapturePhotoSection(context, size, image),
              buildNameInputField(controllerName),
              buildLocationSection(isLoading, addressPlaceholder),
              buildSubmitButton(context, size, image, controllerName, addressPlaceholder, statusPlaceholder, timeStampPlaceholder)
            ],
          ),
        ),
      ) ,
    );
  }
}
