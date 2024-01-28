import 'package:flutter/material.dart';
import 'dart:async';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/main.dart';
import 'package:health_first/src/constants/image_strings.dart';

import '../welcome/welcome_screen.dart'; // Import the main.dart file where MyHomePage is defined

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(1.0, 0.0),
    ).animate(_controller);

    _controller.forward();

    // Use a Timer for delayed navigation
    Timer(Duration(seconds: 20), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Dispose of the AnimationController when the state is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: _animation.value.dx * MediaQuery.of(context).size.width,
                top: 350,
                child: Image(
                  image: AssetImage(tSplashImage),
                  width: 300,
                  height: 150,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,
//     );
//     _animation = Tween<Offset>(
//       begin: Offset(-1.0, 0.0),
//       end: Offset(1.0, 0.0),
//     ).animate(_controller);
//     _controller.forward();
//     @override
//     void dispose() {
//       // Dispose of the AnimationController when the state is disposed
//       _controller.dispose();
//       super.dispose();
//     }
//     // Use a Timer for delayed navigation
//     Timer(Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => WelcomeScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.white,
//           ),
//           AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return Positioned(
//                 left: _animation.value.dx * MediaQuery.of(context).size.width,
//                 top: 350 ,
//                 child: Image(image: AssetImage(tSplashImage),
//                 width: 300,
//                 height: 150,
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//
//
//     );
//     dispose();
//   }
// }
