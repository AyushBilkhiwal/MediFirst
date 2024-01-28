import 'package:flutter/material.dart';
import 'package:get/get.dart';


// Assuming HomeView is in a separate file
import '../bookappointment/appointment.dart';
import '../home_view/home_view.dart';
import 'location.dart';


// List<Map> doctors = [
//   {
//     'docId': 'CS23M106',
//     'img': 'assets/doctor02.png',
//     'doctorName': 'Dr. Romesh Sharma',
//     'doctorTitle': 'Child Specialist'
//   },
//   {
//     'docId': 'CS23M111',
//     'img': 'assets/doctor03.jpeg',
//     'doctorName': 'Dr. Omendra Singh',
//     'doctorTitle': 'Child Specialist'
//   },
//   {
//     'docId': 'CS23M119',
//     'img': 'assets/doctor02.png',
//     'doctorName': 'Dr. Ayush Bhilkiwal',
//     'doctorTitle': 'Child Specialist'
//   },
//   {
//     'docId': 'CS23M115',
//     'img': 'assets/doctor03.jpeg',
//     'doctorName': 'Dr. Rajat Sharma',
//     'doctorTitle': 'Child Specialist'
//   }
// ];


class PopUp {
  static Future<void> showEmergencyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must choose
      builder: (context) => AlertDialog(
        title: Text('Ambulance Assistance!',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black)),
        content: Row(
          children: [
            Icon(Icons.warning_outlined, size: 50),
            SizedBox(width: 10),
            Expanded(
              child: Text('Is this an emergency requiring immediate medical attention?.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent,
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
        contentTextStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blue, // Set background color
            ),
            onPressed: ()=> Get.to(() => const Emergency()), //=> Get.to(() => BookAppointment(docId: 'Hariom',docName: 'CS23M106')),
            child: Text('YES',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black),),
          ),
          ElevatedButton(
            onPressed: () => Get.to(() => const HomeView()),
            child: Text('NO',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class Popping extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Popping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Button Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => PopUp.showEmergencyDialog(context),
          child: Text('Is It Emergency?'),
        ),
      ),
    );
  }
}