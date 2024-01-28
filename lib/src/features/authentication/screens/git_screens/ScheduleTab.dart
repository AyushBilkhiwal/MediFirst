import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/controllers/appointmentcontroller.dart';
import 'package:health_first/src/features/authentication/screens/home_view/home_view.dart';

import 'package:health_first/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:health_first/src/constants/colors.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';



// class ScheduleTab11 extends StatelessWidget {
//   const ScheduleTab11({Key? key}) : super(key: key);
//
//   @override
//   //State<ScheduleTab> createState() => _ScheduleTabState();
//   Widget build(BuildContext context) {
//     var controller = Get.put(AppointmentController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Appointments",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
//
//       ),
//       body: FutureBuilder(
//         future: controller.getAppointment(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData){
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           else{
//             var data = snapshot.data!.docs;
//             return Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ListView.builder(itemCount:data.length,
//                   itemBuilder: (BuildContext context,int index){
//                 return ListTile(
//                   onTap: (){},
//                   leading: CircleAvatar(
//                     child: Image.asset(tGoogleLogoImage),
//                   ),
//                   title: Text("Doctor Name"),
//                   subtitle: Text("Appointment time"),
//                 );
//             },
//               )
//             );
//
//           }
//         },
//       ),
//     );
//   }
// }


class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

enum FilterStatus { Upcoming, Complete, Cancel }

List<Map> schedules = [
  {
    'img': 'assets/logo/doc7.jpg',
    'doctorName': 'Dr. M.K Arora',
    'doctorTitle': 'Dental Specialist',
    'reservedDate': 'Monday, Feb 9',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'assets/logo/doc9.jpg',
    'doctorName': 'Dr. S Rajeshwari',
    'doctorTitle': 'Skin Specialist',
    'reservedDate': 'Tuesday, Feb 2',
    'reservedTime': '1:00 - 2:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'assets/logo/doc4.jpg',
    'doctorName': 'Dr. Rima Das',
    'doctorTitle': 'ENT Specialist',
    'reservedDate': 'Monday, Mar 29',
    'reservedTime': '10:00 - 10:30',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'assets/logo/doc2.jpg',
    'doctorName': 'Dr. Puneet Khanna',
    'doctorTitle': 'General Physician',
    'reservedDate': 'Wednesday, Jan 23',
    'reservedTime': '3:00 - 4:00',
    'status': FilterStatus.Complete
  },
  {
    'img': 'assets/logo/doc3.jpg',
    'doctorName': 'Dr. Ravina Shekhawat',
    'doctorTitle': 'Dental Specialist',
    'reservedDate': 'Thursday, Mar 12',
    'reservedTime': '8:00 - 9:00',
    'status': FilterStatus.Cancel
  },
  {
    'img': 'assets/logo/doc1.jpg',
    'doctorName': 'Dr. Durgesh Sharma',
    'doctorTitle': 'Other Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Cancel
  },
];

class _ScheduleTabState extends State<ScheduleTab> {
  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: header01,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Upcoming) {
                                  status = FilterStatus.Upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Complete) {
                                  status = FilterStatus.Complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Cancel) {
                                  status = FilterStatus.Cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: TextStyle(
                                  color: bg02,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    margin: !isLastElement
                        ? EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(_schedule['img']),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                     _schedule['doctorName'],
                                    style: TextStyle(
                                      color: header01,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['doctorTitle'],
                                    style: TextStyle(
                                      color: grey02,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DateTimeCard(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  child: Text('Cancel'),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  child: Text('Reschedule'),
                                  onPressed: () => {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bg03,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: primary,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Thursday, Mar 12',
                style: TextStyle(
                  fontSize: 12,
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: primary,
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '1:00 ~ 2:10',
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
