import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/home_view/home_view.dart';
import 'package:health_first/src/features/authentication/controllers/login_controller.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tEmail,
                    hintText: tEmail,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                  controller: controller.password,
                  obscureText: !controller.showPassword.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    labelText: tPassword,
                    hintText: tPassword,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                        controller.showPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 20,
                ),

                // Forget password btn

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ForgetPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: Text(tForgetPassword),
                  ),
                ),

                // Login btn

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.loginUser();
                      if (controller.userCredential != null) {
                        Get.to(() => const HomeView());
                      }
                    },
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
