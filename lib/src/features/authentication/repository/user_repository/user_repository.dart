import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_first/firebase_options.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:health_first/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/models/user_model.dart';
import 'package:health_first/src/features/authentication/screens/hospital_page/hospital_page.dart';
import 'package:health_first/src/features/authentication/screens/git_screens/doctor_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async{
    await _db.collection("Users").add(user.toJson())
        .then((value) {
      Get.snackbar("Success", "Your account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    })
        .catchError((error, stackTrace) {
          Get.snackbar("ERROR","Something went wrong. Try Again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      // Handle the error here
      print(error.toString());
      // You can show an error message to the user or log the error.
    });
  }


  Future<UserModel> getUserDetails(String email) async{
    final snapshot=await _db.collection("Users").where("email",isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    // final userData= snapshot.docs.map((e)) =>UserModel.fromSnapshot((e)).single;
    return userData;

  }
}

