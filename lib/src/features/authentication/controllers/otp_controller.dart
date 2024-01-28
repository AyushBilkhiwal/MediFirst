import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:health_first/src/features/authentication/screens/home_view/home_view.dart';
class OTPController extends GetxController{
  static OTPController get instance =>Get.find();
  void verifyOTP (String otp) async{
    var isVerified=await AuthenticationRepository.instance.verifyOtp(otp);
    isVerified ? Get.offAll(const HomeView()): Get.back();
  }
}