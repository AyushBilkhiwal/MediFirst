import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/controllers/appointmentcontroller.dart';


//
//
class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  //State<ScheduleTab> createState() => _ScheduleTabState();
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),

      ),
      body: FutureBuilder<QuerySnapshot>(
        future: controller.getAppointments(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(itemCount:data.length,
                  itemBuilder: (BuildContext context,int index){
                return ListTile(
                  onTap: (){},
                  leading: CircleAvatar(
                    child: Image.asset('assets/logo/appoint.jpg'),
                  ),
                  title: Text(data[index]['appWithName']),
                  subtitle: Text("${data[index]['appDay']} - ${data[index]['appTime']}",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.blueGrey),)
                );
            },
              )
            );

          }
        },
      ),
    );
  }
}

