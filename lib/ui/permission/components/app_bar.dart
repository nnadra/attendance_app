import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    leading: IconButton(
      onPressed: () {}, 
      icon: Icon(Icons.arrow_back_ios, color: Colors.white
      )
    ),
    title: Text(
      "Permission Request Menu",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    ),
  );
}