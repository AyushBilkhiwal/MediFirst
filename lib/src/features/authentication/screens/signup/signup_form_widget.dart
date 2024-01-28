import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/common_widgets/form/form_header_widget.dart';
import 'package:health_first/src/constants/colors.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/controllers/signup_controller.dart';
import 'package:health_first/src/features/authentication/models/user_model.dart';
import 'package:health_first/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';
import 'package:health_first/src/features/authentication/controllers/signup_controller.dart';
class signUpFormWidget extends StatelessWidget {
  const signUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: tSecondaryColor)))),
            SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: tSecondaryColor)))),
            SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(tPhoneNo),
                    prefixIcon: Icon(Icons.numbers),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: tSecondaryColor)))),
            SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
                // validator: ,
                controller: controller.password,
                decoration: const InputDecoration(
                    label: Text(tPassword),
                    prefixIcon: Icon(Icons.fingerprint),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: tSecondaryColor)))),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ?????????????????????????????????????????????????????????????????????????????????????????????????????
                      // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                      // SignUpController.instance.phoneAuthenticatiion(controller.phoneNo.text.trim());
                      final user = UserModel(
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(), id: '',
                      );
                      SignUpController.instance
                          .createUser(user);


                    }
                  },
                  child: Text(tSignup.toUpperCase()),
                ))
          ],
        ),
      ),
    );
  }
}
