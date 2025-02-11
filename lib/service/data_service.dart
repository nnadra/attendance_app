import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');
  
  //getData = mengambil data dari internet
  //ini method get, kita ambil dulu
  Future<QuerySnapshot> getData() async {
    //u mendapatkan/membaca data dari database

    return dataCollection.get();
}

//buat CRUD
//buat method delete
Future<void> deleteData (String docId) {
  //untuk menghapus data dari database
  return dataCollection.doc(docId).delete();
}
}