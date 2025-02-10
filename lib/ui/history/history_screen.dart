import 'package:attadence_app/service/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class _AttencaceHistoryScreenState extends StatefulWidget {
  const _AttencaceHistoryScreenState({super.key});

  @override
  State<_AttencaceHistoryScreenState> createState() => __AttencaceHistoryScreenStateState();
}

class __AttencaceHistoryScreenStateState extends State<_AttencaceHistoryScreenState> {
  final DataService dataService = DataService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance History"),
      ),
      body: StreamBuilder( //digunakan u agar widget kita satu kesatuan atau membuat UI termanage
        stream: dataService.dataCollection.snapshots(), //memangil data yang kita punya //snaphots memberi tahu sudah siap digunakan
       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Data Here")
            );
          }
          //docs semua yang ada 
          final data = snapshot.data!.docs;

          //mangil ketika ada Data untuk di taro di UI
          return ListView.builder(
            itemCount: data.length, //data.lenght = jumlah datanya berapa? tergantung di isi apa sama user
            itemBuilder: (context, index) {
              //TODO: put attendance card UI here
            }
          );
       },
      )
    );
  }
}