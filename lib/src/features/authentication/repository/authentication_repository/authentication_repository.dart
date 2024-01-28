import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_first/src/features/authentication/screens/home_view/home_view.dart';
import 'package:health_first/firebase_options.dart';
import 'package:health_first/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/exception/signup_amil_password_failure.dart';
import 'package:health_first/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const HomeView());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value=verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value=verificationId;
      },
      verificationFailed: (e) {
        if(e.code=='invalid-phone-number'){
          Get.snackbar('Error', 'The provided phone number is not valid. ');
        }
        else{
          Get.snackbar('Error', 'Something went wrong please try again');
        }
      },
    );
  }
  Future<bool> verifyOtp(String otp) async {
    var credentials=await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user !=null? true :false;
    

  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomeView())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase auth exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("Exception - ${ex.message}");
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
    } catch (_) {}
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const WelcomeScreen());
    } catch (e) {
      print('Logout error: $e');
    }
  }
}
