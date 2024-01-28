import 'package:flutter/material.dart';
import 'package:health_first/src/common_widgets/form/form_header_widget.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:health_first/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
class ForgetPasswordMailScreen extends StatelessWidget{
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children:  [
                SizedBox(height: tDefaultSize * 4),
            const FormHeaderWidget(
              crossAxisAlignment: CrossAxisAlignment.center,
              image: tForgetPasswordImage,
              title: tForgetPassword,
              subTitle: tForgetPasswordSubTitle,

              heightBetween: 30.0,
              textAlign: TextAlign.center,
                ),
                SizedBox(height: tFormHeight),
                Form(child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: ()=> Get.to(() => const OTPScreen()), child: Text(tNext),style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                      ),),
                    ),
                  ],
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}