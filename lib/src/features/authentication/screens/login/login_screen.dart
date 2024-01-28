import 'package:flutter/material.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:health_first/src/features/authentication/screens/login/login_header_widget.dart';
import 'package:health_first/src/features/authentication/screens/login/login_footer_widget.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeaderWidget(size: size),
            const LoginForm(),
            const LoginFooterWidget()
          ],
        ),
      ))),
    );
  }
}












// class LoginFooterWidget extends StatelessWidget {
//   const LoginFooterWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const Text("OR"),
//         const SizedBox(
//           height: tFormHeight - 20,
//         ),
//         SizedBox(
//           width: double.infinity,
//           child: OutlinedButton.icon(
//               icon: Image(
//                 image: AssetImage(tGoogleLogoImage),
//                 width: 25.0,
//               ),
//               onPressed: () {},
//               label: Text(tSignInWithGoogle)),
//         ),
//         const SizedBox(
//           height: tFormHeight - 20,
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text.rich(TextSpan(
//               text: tDontHaveAnAccount,
//               children: [
//                 TextSpan(text: tSignup,
//                 style: TextStyle(color: Colors.blue))
//               ]
//           ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class LoginHeaderWidget extends StatelessWidget {
//   const LoginHeaderWidget({
//     super.key,
//     required this.size,
//   });
//
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image(
//           image: AssetImage(tWelcomeScreenImage),
//           height: size.height * 0.2,
//         ),
//         Text(
//           tLoginTitle,
//           style: Theme.of(context).textTheme.displaySmall,
//         ),
//         Text(
//           tLoginSubTitle,
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ],
//     );
//   }
// }

// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(child: Container(
//       padding: const EdgeInsets.symmetric(vertical: tFormHeight-10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Icons.person_outline_outlined),
//               labelText: tEmail,
//               hintText: tEmail,
//               border: OutlineInputBorder()
//             ),
//           ),
//           const SizedBox(height: tFormHeight-20,),
//           TextFormField(
//
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Icons.fingerprint),
//               labelText: tPassword,
//               hintText: tPassword,
//               border: OutlineInputBorder(),
//               suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
//             ),
//           ),
//           const SizedBox(height: tFormHeight-20,),
//           Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(onPressed: (){}, child: Text(tForgetPassword))),
//         SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(onPressed: (){}, child: Text(tLogin.toUpperCase()))),
//         ],
//       ),
//     ));
//   }
// }
