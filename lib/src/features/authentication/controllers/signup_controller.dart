import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_first/firebase_options.dart';
import 'package:health_first/src/features/authentication/models/user_model.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:health_first/src/features/authentication/repository/user_repository/user_repository.dart';
import 'package:health_first/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:health_first/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignUpController extends GetxController{
  static SignUpController get instance =>Get.find();
  final email=TextEditingController();
  final password=TextEditingController();
  final fullName=TextEditingController();
  final phoneNo=TextEditingController();
  final userRepo = Get.put(UserRepository());
  void registerUser(String email,String password){
    String? error=AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error!=null){
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }

  }
  Future<void> createUser(UserModel user) async{
     await userRepo.createUser(user);
    // AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    phoneAuthentication(user.phoneNo);
    Get.to(()=> const OTPScreen());
  }
  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}