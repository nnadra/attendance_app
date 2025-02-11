import 'package:attadence_app/service/data_service.dart';
import 'package:attadence_app/ui/history/components/attendance_card.dart';
import 'package:attadence_app/ui/history/components/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class _AttencaceHistoryScreenState extends StatefulWidget {
  const _AttencaceHistoryScreenState({super.key, required Null Function() onConfirm});

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
              return AttendanceHistoryCard(
                //u mendefinisakan data yang akan muncul di UI berdasarkan index/posisi yang ada di database
                data: data[index].data() as Map<String, dynamic>,
                onDelete: () {
                  showAboutDialog(
                    context: context,
                  builder: (context) => DeleteDialog(
                    //Untuk menjadikan index sebagai id dari data yang ada di database
                    documentId:data[index].id,
                    dataCollection: dataService.dataCollection,
                    //digunakan u memperbarui state setelah terjadi penghapusan data dari database
                    onConfirm: () {
                      setState(() {
                        dataService.deleteData(data[index].id);
                        Navigator.pop(context);
                      });
                    }
                    //belum 
                  )

                  );
                },
              );
            }
          );
       },
      )
    );
  }
}