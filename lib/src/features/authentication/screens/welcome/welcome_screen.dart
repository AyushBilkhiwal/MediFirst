import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_first/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:health_first/src/constants/colors.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';
class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var height=MediaQuery.of(context).size.height;
    var brightness=MediaQuery.of(context).platformBrightness;
    final isDarkMode=brightness==Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor: peachColor,
        body: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage(tWelcomeScreenImage),height:height * 0.6,width: 300,),
              Text("MediFirst", style: Theme.of(context).textTheme.displaySmall),
              // Text(tWelcomeTitle, style: Theme.of(context).textTheme.displaySmall),
              Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: () => Get.to(() => const LoginScreen()),
      
                      child: Text(tLogin.toUpperCase()))),
                  SizedBox(width: 10.0,),
                  Expanded(child: ElevatedButton(onPressed: () => Get.to(() => const SignUpScreen()),
      
                      child: Text(tSignup.toUpperCase()))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}