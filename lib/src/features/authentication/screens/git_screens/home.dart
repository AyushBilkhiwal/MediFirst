import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/screens/git_screens/HomeTab.dart';
import 'package:health_first/src/features/authentication/screens/git_screens/ScheduleTab.dart';
import 'package:health_first/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:health_first/src/constants/colors.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List<Map> navigationBarItems = [
  {'icon': Icons.local_hospital, 'index': 0},
  {'icon': Icons.calendar_today, 'index': 1},
];

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void goToSchedule() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeTab(
        onPressedScheduleCard: goToSchedule,
      ),
      ScheduleTab(),
    ];
    backgroundColor: peachColor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: screens[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          selectedItemColor: primary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            for (var navigationBarItem in navigationBarItems)
              BottomNavigationBarItem(
                icon: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border(
                      top: _selectedIndex == navigationBarItem['index']
                          ? BorderSide(color: bg01, width: 5)
                          : BorderSide.none,
                    ),
                  ),
                  child: Icon(
                    navigationBarItem['icon'],
                    color: _selectedIndex == 0
                        ? bg01
                        : bg02,
                  ),
                ),
                label: '',
              ),
          ],
          currentIndex: _selectedIndex,
          onTap: (value) => setState(() {
            _selectedIndex = value;
          }),
        ),
      ),
    );
  }
}
