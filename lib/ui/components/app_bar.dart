import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    leading:IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () => Navigator.of(context).pop()
      ),
      title: Text(
        "Attendance Menu",
        style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
  );
}