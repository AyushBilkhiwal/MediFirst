import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_first/firebase_options.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:health_first/src/features/authentication/screens/appointments_booked/appointments_view.dart';
import 'package:health_first/src/features/authentication/screens/category_view/category_view.dart';
import 'package:health_first/src/features/authentication/screens/popup/popup.dart';
import 'package:health_first/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/screens/hospital_page/hospital_page.dart';
import 'package:health_first/src/features/authentication/screens/git_screens/doctor_detail.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/detail': (context) => SliverDoctorDetail(),
        // Other routes...
        '/covid19Page': (context) => AppointmentView(),
        '/hospitalPage': (context) => HospitalPage(),
        '/ambulancePage':(context) => Popping(),// Register the HospitalPage route
      },
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Health First"),
      ),
      body: Center(
        child: Text(
          "Home Screen",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
    );
  }
}
