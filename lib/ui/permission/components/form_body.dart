import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBody extends StatelessWidget {
  const FormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final formController = TextEditingController();
    final toController = TextEditingController();
    String dropValueCategories = "Please Choose";
    var categoriesList = <String> [
      'Please Choose',
      'Sick',
      'IDN Teaching',
      'Others'
    ];

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(),
              labelText: 'Your Name',
              hintText: "Plese Enter your Name ",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent), 
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent)
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 16,
                color: Colors.black
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blueAccent,
                style: BorderStyle.solid,
                width: 1
              )
            ),
            child: DropdownButton(
              dropdownColor: Colors.white,
              value: dropValueCategories,
              onChanged: (value) {
                dropValueCategories = value.toString();
              },
              items: categoriesList.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                    ),
                  ),
                  );
              //Method toList() berfungsi u mengkonversi sebuah data acak menjadi berurutan pada list
              }).toList(),
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black
                ),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              isExpanded: true,
              ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Form",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(), //bmemberi tahu waktu sekarang
                                firstDate: DateTime(2025), 
                                lastDate: DateTime(2025)
                                );

                                if (pickedDate != null) {
                                  //untuk mengkoversikan data detail tanggal yang diambil dari picker date menjadi format dd/mm/yy
                                  formController.text = DateFormat('dd/mm/yy').format(pickedDate);
                                }
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                           controller: formController,
                           decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Starting",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            )
                           ),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Until:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context, 
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2025), 
                                    lastDate: DateTime(2025)
                                    );
                                    if (pickedDate != null) {
                                      toController.text = DateFormat('dd/mm/yyyy').format(pickedDate);
                                    }
                                },
                                style: TextStyle(
                                  fontSize: 16 ,
                                  color: Colors.black
                                ),
                                controller: toController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Until",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                  )
                                ),
                              ))
                          ],
                        ))
                    ],
                  ),
                )
              ],
            ),)
        ],
      ), );
  }
}