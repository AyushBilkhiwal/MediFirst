import 'package:flutter/material.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/screens/home_view/home_view.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';
import 'package:health_first/src/features/authentication/screens/signup/signup_screen.dart';
class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: Image(
                image: AssetImage(tGoogleLogoImage),
                width: 25.0,
              ),
              onPressed: () {},
              label: Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () => Get.to(() => const SignUpScreen()),
          child: Text.rich(TextSpan(
              text: tDontHaveAnAccount,
              children: [
                TextSpan(text: tSignup,
                    style: TextStyle(color: Colors.blue))
              ]
          ),
          ),
        ),
      ],
    );
  }
}