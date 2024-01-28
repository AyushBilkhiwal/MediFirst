import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/common_widgets/form/form_header_widget.dart';
import 'package:health_first/src/constants/colors.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/signup/signup_form_widget.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                ),
                const signUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      height: tFormHeight - 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 20.0,
                        ),
                        label:  Text(tSignInWithGoogle.toUpperCase()),
                      ),
                    ),
                    TextButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: tAlreadyHaveAnAccount,
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(
                            text: tLogin.toUpperCase(),
                          )
                        ])))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class signUpFormWidget extends StatelessWidget {
//   const signUpFormWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
//       child: Form(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//                 decoration: const InputDecoration(
//                     label: Text(tFullName),
//                     prefixIcon: Icon(Icons.person_outline_rounded),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 2.0, color: tSecondaryColor)))),
//             SizedBox(
//               height: tFormHeight - 20,
//             ),
//             TextFormField(
//                 decoration: const InputDecoration(
//                     label: Text(tEmail),
//                     prefixIcon: Icon(Icons.email_outlined),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 2.0, color: tSecondaryColor)))),
//             SizedBox(
//               height: tFormHeight - 20,
//             ),
//             TextFormField(
//                 decoration: const InputDecoration(
//                     label: Text(tPhoneNo),
//                     prefixIcon: Icon(Icons.numbers),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 2.0, color: tSecondaryColor)))),
//             SizedBox(
//               height: tFormHeight - 20,
//             ),
//             TextFormField(
//                 decoration: const InputDecoration(
//                     label: Text(tPassword),
//                     prefixIcon: Icon(Icons.fingerprint),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             width: 2.0, color: tSecondaryColor)))),
//             const SizedBox(
//               height: tFormHeight - 10,
//             ),
//             SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(tSignup.toUpperCase()),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
