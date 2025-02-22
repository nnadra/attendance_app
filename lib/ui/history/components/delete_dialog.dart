import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String documentId;
  final CollectionReference dataCollection;

  //onConfirm = 
  const DeleteDialog({super.key, required this.documentId, required this.dataCollection, Null Function()? onConfirm});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete Data',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black
        ),
      ),
      content: const Text(
        "Are you sure you want to delete this data?",
        style: TextStyle(
          fontSize: 14,
          color: Colors.black
        ),
      ),
      //untuk makesure 
      actions: [
        TextButton(child: const Text(
          "Yes",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black
          ),
        ),
        onPressed: () {
          //u berkomunikasi dengan database u melakukan penghapusan data dari database
          dataCollection.doc(documentId).delete();
          Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text(
            "No",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black
            ),
          ) ,
          onPressed: () {
            Navigator.of(context).pop();
          }, )
      ],
    );
  }
}