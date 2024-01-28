import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_first/firebase_options.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:health_first/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/screens/hospital_page/hospital_page.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.put(LoginController());

  final TextEditingController  email = TextEditingController();
  final TextEditingController  password = TextEditingController();
  RxBool showPassword =true.obs;
  void togglePasswordVisibility() {
    showPassword.toggle();
    update(); // Notify the UI that the state has changed
  }
  UserCredential? userCredential;
  Future<void> loginUser() async {

    try {
      userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
      // await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text, password.text);
    } catch (error) {
      Get.snackbar('Login Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    }
  }
}
