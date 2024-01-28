import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter_map/flutter_map.dart';
import 'package:health_first/src/features/authentication/screens/bookappointment/appointment.dart';
import 'package:health_first/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:health_first/src/constants/colors.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:latlong2/latlong.dart' as latLng;
// Import statements
List<Map> doctors = [
  {
    'img': 'assets/logo/doc2.jpg',
    'doctorName': 'Dr. Naveen Kumar',
    'doctorTitle': 'MBBS,FCPS,MS[USAIM]'
  },
  {
    'img': 'assets/logo/doc5.jpg',
    'doctorName': 'Dr. AISHWARYA REWADKAR',
    'doctorTitle': 'MBBS,DPB,AFIH,MBA'
  },
  {
    'img': 'assets/logo/doc4.jpg',
    'doctorName': 'Dr. BHIMRAO PAWAR',
    'doctorTitle': 'MBBS MD MEDICINE'
  },
  {
    'img': 'assets/logo/doc3.jpg',
    'doctorName': 'Dr. ABHIJEET MORE',
    'doctorTitle': 'BAMS CGO'
  }
];
// class SliverDoctorDetail extends StatelessWidget {
//   const SliverDoctorDetail({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             title: Text('Doctor Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//             backgroundColor: Colors.red,
//             expandedHeight: 200,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image(
//                 image: AssetImage('assets/logo/groupdoc.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: DetailBody(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class DetailBody extends StatelessWidget {
//   const DetailBody({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(30),
//       margin: EdgeInsets.only(bottom: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           DetailDoctorCard(),
//           SizedBox(
//             height: 30,
//           ),
//           DoctorInfo(),
//           SizedBox(
//             height: 30,
//           ),
//           Text(
//             'About Doctor',
//             style: TextStyle(
//               color: Colors.grey[700],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Text(
//             'Dr. Joshua Simorangkir is a specialist in internal medicine who specialized blah blah.',
//             style: TextStyle(
//               color: Colors.purple[900],
//               fontWeight: FontWeight.w500,
//               height: 1.5,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             'Location',
//             style: TextStyle(
//               color: Colors.grey[700],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           // DoctorLocation(),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(
//                 Colors.blueAccent,
//               ),
//             ),
//             child: Text('Book Appointment'),
//             onPressed: () => Get.to(() => BookAppointment(
//               docId: 'RNc3rjA7enbrEwPJEtOF',
//               docName: 'Dr. Joshua Simorangkir', // Provide the actual doctor name here
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SliverDoctorDetail extends StatelessWidget {
  const SliverDoctorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> doctorInfo = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(doctorInfo['doctorName'] ?? 'Doctor Details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.red,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/logo/groupdoc.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DetailBody(doctorInfo: doctorInfo),
          )
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  final Map<String, String> doctorInfo;

  const DetailBody({
    Key? key,
    required this.doctorInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailDoctorCard(doctorName: doctorInfo['doctorName'] ?? '',
              doctorTitle: doctorInfo['doctorTitle'] ?? ''),
          SizedBox(
            height: 30,
          ),
          DoctorInfo(),
          // DoctorLocation(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blueAccent,
              ),
            ),
            child: Text('Book Appointment',style: TextStyle(color: Colors.white),),
            onPressed: () =>
                Get.to(() =>
                    BookAppointment(
                      docId: 'RNc3rjA7enbrEwPJEtOF',
                      docName: 'Dr. Joshua Simorangkir', // Provide the actual doctor name here
                    )),

            // Rest of the code remains unchanged...
          ),
        ],
      ),
    );
  }
}
class DetailDoctorCard extends StatelessWidget {
  final String doctorName;
  final String doctorTitle;

  const DetailDoctorCard({
    Key? key,
    required this.doctorName,
    required this.doctorTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      doctorTitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Image(
                image: AssetImage('assets/logo/doc27.jpeg'),
                width: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Other widgets and classes remain unchanged
//
//
// class DoctorLocation extends StatelessWidget {
//   const DoctorLocation({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("Building DoctorLocation");
//
//     return SizedBox(
//       width: double.infinity,
//       height: 200,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: FlutterMap(
//           options: MapOptions(
//             center: LatLng(51.5, -0.09),
//             zoom: 13.0,
//           ),
//           layers: [
//             TileLayerOptions(
//               urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//               subdomains: ['a', 'b', 'c'],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DoctorLocation extends StatelessWidget {
//   const DoctorLocation({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 200,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: FlutterMap(
//           options: MapOptions(
//             center: latLng.LatLng(51.5, -0.09),
//             zoom: 13.0,
//           ),
//           layers: [
//             TileLayerOptions(
//               urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//               subdomains: ['a', 'b', 'c'],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DoctorInfo extends StatelessWidget {
  final Random random=Random();
  String getRandomPatients() {
    return '${random.nextInt(100) + 1}+'; // Generates a random number between 1 and 100
  }

  String getRandomExperience() {
    return '${random.nextInt(5) + 1} years'; // Generates a random number between 1 and 20
  }

  String getRandomRating() {
    return '${(random.nextDouble() * 5).toStringAsFixed(1)}'; // Generates a random rating between 0.0 and 5.0
  }
  DoctorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        NumberCard(
          label: 'Patients',
          value: getRandomPatients(),
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Experiences',
          value: getRandomExperience(),
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Rating',
          value: getRandomRating(),
        ),
      ],
    );
  }
}

class AboutDoctor extends StatelessWidget {
  final String title;
  final String desc;
  const AboutDoctor({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NumberCard extends StatelessWidget {
  final String label;
  final String value;

  const NumberCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bg03,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: grey02,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: header01,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailDoctorCard extends StatelessWidget {
//   const DetailDoctorCard({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: Container(
//           padding: EdgeInsets.all(15),
//           width: double.infinity,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Dr. Josua Simorangkir',
//                       style: TextStyle(
//                           color: header01,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Heart Specialist',
//                       style: TextStyle(
//                         color: grey02,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Image(
//                 image: AssetImage('assets/doctor01.jpeg'),
//                 width: 100,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }