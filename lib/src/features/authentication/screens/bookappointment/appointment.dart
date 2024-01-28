import 'dart:ffi';
import 'package:flutter/src/material/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/constants/custom_textfield.dart';
// import 'package:health_first/src/features/authentication/controllers/appointmentcontroler.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/constants/custom_textfield.dart';
// import 'package:health_first/src/features/authentication/controllers/appointmentcontroler.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/constants/custom_textfield.dart';
// import 'package:health_first/src/features/authentication/controllers/appointmentcontroler.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/constants/custom_textfield.dart';
// import 'package:health_first/src/features/authentication/controllers/appointmentcontroler.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/constants/custom_textfield.dart';
import 'package:health_first/src/features/authentication/controllers/appointmentcontroller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controllers/appointmentcontroller.dart';

class BookAppointment extends StatelessWidget {
  final String docName;
  final String docId;
  const BookAppointment({Key? key, required this.docId, required this.docName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Book an Appointment",
            style: TextStyle(
      
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Appointment Day',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    _selectDate(context, controller);
                  },
                  child: CustomTextField(
                    hint: 'Select day',
                    textController: controller.appDayController,
                    enabled: false, // Typo fixed: changed Enabled to enabled
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Select Appointment Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Select time',
                  textController: controller.appTimeController,
                ),
                SizedBox(height: 10),
                Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Enter your mobile number',
                  textController: controller.appMobileController,
                ),
                SizedBox(height: 10),
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Enter your full name',
                  textController: controller.appNameController,
                ),
                SizedBox(height: 10),
                Text(
                  'Message',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Enter your message',
                  textController: controller.appMessageController,
                ),
                SizedBox(height: 10,),
                Text(
                  'Doctor Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                 CustomTextField(
                   hint: 'Doctor Name',
                   textController: controller.docName,
                 ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
            onPressed: () async {
              await controller.bookAppointment(docId, context);
            },
            child: Text(
              "Book an appointment",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 19,color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
              Colors.blueAccent, // Set the button's primary color to grey
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildCalendarPicker(
      BuildContext context, AppointmentController controller) {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(Duration(days: 365)),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      onPageChanged: (focusedDay) {
        // Do something when the page changes
      },
      onDaySelected: (selectedDay, focusedDay) {
        controller.setSelectedDate(selectedDay);
      },
    );
  }
}

void _selectDate(BuildContext context, AppointmentController controller) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: controller.selectedDate,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 365)),
  );

  if (pickedDate != null && pickedDate != controller.selectedDate) {
    controller.setSelectedDate(pickedDate);
  }
}

