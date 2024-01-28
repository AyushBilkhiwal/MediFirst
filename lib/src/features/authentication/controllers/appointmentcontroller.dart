//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_first/src/features/authentication/screens/home_view/home_view.dart';
import 'package:health_first/firebase_options.dart';
//import 'package:health_first/src/features/authentication/screens/profile/profile_screen.dart';
//import 'package:health_first/src/features/authentication/repository/authentication_repository/exception/signup_amil_password_failure.dart';
import 'package:health_first/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;

  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  var docName = TextEditingController();

  DateTime selectedDate = DateTime.now();

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    appDayController.text = "${date.day}/${date.month}/${date.year}";
  }

  Future<void> bookAppointment(String docId, context) async {
    isLoading(true);

    try {
      var store = FirebaseFirestore.instance.collection('appointments').doc();
      await store.set({
        'appBy': FirebaseAuth.instance.currentUser?.uid,
        'appDay': "Tuesday" /*appDayController.text*/,
        'appTime': appTimeController.text,
        'appMobile': appMobileController.text,
        'appName': appNameController.text,
        'appMessage': appMessageController.text,
        'appWithName': docName.text,
        'appWith': docId,

      });

      VxToast.show(context, msg: "Appointment is booked successfully!");
    } catch (error) {
      print("Error booking appointment: $error");
      VxToast.show(
          context, msg: "Failed to book appointment. Please try again.");
    } finally {
      isLoading(false);
      Get.back();
    }
  }
    Future<QuerySnapshot<Map<String,dynamic>>>getAppointments(){
      return FirebaseFirestore.instance.collection('appointments').get();


  }
}
