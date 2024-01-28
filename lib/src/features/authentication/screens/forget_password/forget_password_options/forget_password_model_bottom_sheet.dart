import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/forget_password/forget_password_phone/forget_password_phone.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/constants/colors.dart';
import 'forgot_password_btn_widget.dart';
import 'package:health_first/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    var brightness=MediaQuery.of(context).platformBrightness;
    final isDarkMode=brightness==Brightness.dark;
    return showModalBottomSheet(
      backgroundColor: isDarkMode ? tSecondaryColor: tPrimaryColor,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => SingleChildScrollView(
        child: Container(
          
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tForgetPasswordTitle,

                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                tForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 30.0,
              ),
              ForgetPasswordBtnWidget(
                btnIcon: Icons.mail_outline_rounded,
                title: tEmail,
                subTitle: tResetViaEmail,
                onTap: () {
                  Navigator.pop(context);
                  Get.to(()=> const ForgetPasswordMailScreen());},
              ),
              SizedBox(
                height: 10.0,
              ),
              ForgetPasswordBtnWidget(
                btnIcon: Icons.mobile_friendly_rounded,
                title: tPhoneNo,
                subTitle: tResetViaPhone,
                onTap: () {
                  Navigator.pop(context);
                  Get.to(()=> const ForgetPasswordPhoneScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}