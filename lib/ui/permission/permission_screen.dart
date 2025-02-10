import 'package:attadence_app/service/location_service.dart';
import 'package:attadence_app/ui/components/app_bar.dart';
import 'package:attadence_app/ui/permission/components/form_body.dart';
import 'package:attadence_app/ui/permission/components/submit_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'components/form_header.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:buildAppBar(context), // bikin appbar method,
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          elevation: 5,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeader(
                title: "Permission Request Form", 
                icon: Icons.assignment
                ),
              const FormBody(),
              SubmitButton(
                size: size, 
                nameController: TextEditingController(), 
                formController: TextEditingController(), 
                toController: TextEditingController(), 
                dropValueCategories: "Dropdown Content", 
                dataCollection: FirebaseFirestore.instance.collection("collectionPath")
                ),
            ],
          ),
        ),
      )
    );
  }

}