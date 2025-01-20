import 'package:attadence_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //memperkenalkan firebase mengunakan initialiazeApp
    options: const FirebaseOptions(
      //data diambil dari file google-service.json
      apiKey: 'AIzaSyC6QIiLBuV1QjekWpVd5UrXJ-3df8_D0vI', //cureent_key
      appId: "1:514915849292:android:fa12933be73dba8219d0e9", //mobilesdk_app_id
      messagingSenderId: "514915849292", //project_number 
      projectId: "attendance-app-60d78") //project_id
  ); 
  runApp(const AttendanceApp());    
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: const CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}