import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/features/authentication/controllers/otp_controller.dart';
import 'package:otp_text_field/otp_text_field.dart';

import 'package:health_first/src/common_widgets/form/form_header_widget.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController=Get.put(OTPController());
    var otp;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tOtpTitle,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                ),
              ),
              Text(tOtpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                tOtpMessage + "hm996966@gmail.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  otp=code;
                  OTPController.instance.verifyOTP(otp);
                  print(
                      "OTP is => $code");
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        OTPController.instance.verifyOTP(otp);
                      }, child: const Text(tNext))),
            ],
          ),
        ),
      ),
    );
  }
}
