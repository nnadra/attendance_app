import 'package:attadence_app/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//an entry point for submmitting the attendance report
final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

Future<void> submitAttandanceReport(
  BuildContext context, 
  String address, 
  String name, 
  String attandanceStatus,
  String timeStamp
  ) 
  async {
  showLoaderDialog(context);
  dataCollection.add(
    {
      'address': address,
      'name': name,
      'description': attandanceStatus,
      'timeStamp': timeStamp,
    }
    //collect data yang mau di submit
  ).then((result) { //then dari async
    Navigator.of(context).pop();

    //try = ketika datanya sudah benar
    try { 
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle_outline, 
                color: Colors.white,
                ),
              SizedBox(width:10),
              Text(
                "Attendace submitted successfully",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          backgroundColor: Colors.orangeAccent,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
        )
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen())
        );
    }
    catch(e) {
      //catch = ketika datanya salah
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Ups, $e",
                  style: TextStyle(color: Colors.white),
                ))
            ],
        ),
        backgroundColor: Colors.blueAccent,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));

    }
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Ups $error",
              style: TextStyle(color:Colors.white ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.blueAccent,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      ));
      Navigator.of(context).pop();
  });
}
void showLoaderDialog(BuildContext context) {
 AlertDialog alert = AlertDialog(
  content: Row(
    children: [
      CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
      Container(
        margin: EdgeInsets.only(left:20 ),
        child: Text("Checking the data"),
      )
    ],
  ) ,
 );

 showDialog(
  barrierDismissible: false,
  context: context, 
  builder: (BuildContext context){
    return alert;
  });
}