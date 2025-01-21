import 'package:attadence_app/ui/attend/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope( //untuk maksure mau di back atau ngga
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _onWillPop;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
          _buildMenuItem(
            context, 
            imagePath: '/assets/image/ic_attend.png', 
            label: 'Attendance Report', 
            destination:AttendanceScreen(),
          ),
          const SizedBox(height: 40,),

          _buildMenuItem(
            context, 
            imagePath: '/assets/image/ic_attendanceHistory.png ', 
            label: 'Attendance Report', 
            destination:AttendanceScreen(),
          ),
          const SizedBox(height: 40,),

          _buildMenuItem(
            context, 
            imagePath: '/assets/image/ic_permission.png', 
            label: 'Attendance History', 
            destination:AttendanceScreen(),
          ),
          const SizedBox(height: 40,),
           ],
          ),
        ),
      ),
    );
  }

  Container _buildMenuItem(
    BuildContext context,{
      required String imagePath,
      required String label,
      required Widget destination,
    }
    ) {
    return Container(
          margin: const EdgeInsets.all(10),
          child: Expanded(
            child: InkWell(
              highlightColor: Colors.transparent ,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  destination));
              },
          child:Column(
            children: [
              Image(
                image: AssetImage(imagePath),
                width: 100,
                height: 100 , 
              ),
              const Text(
                "Attendance",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
            )),
        );
  }

Future<bool> _onWillPop(BuildContext context) async {
  return (await showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (context) => 
    AlertDialog(
      title: const Text("Information",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        "Do yoy want to Texi?",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16
        ),
      ),
      actions: [
        TextButton(
          //() => Navigator.of(context).pop(false)
          onPressed:() => Navigator.of(context).pop(false), 
          child: const Text(
            "No",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14
            ),
          )
          ),

          TextButton(onPressed: () => SystemNavigator.pop(), 
          child: const Text(
            " Yes I want to Exit",
            style: TextStyle(
              color: Colors.white
            ),
          )
        )
      ],
      
            )
          )
          //ini adalah default value ketika semua kode yang ada di
          //blok alert dialog tidak tereksekusi karena beberapa hal
        ) ??
        false;
      }
    }