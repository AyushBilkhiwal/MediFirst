import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:get/get.dart';
import 'package:health_first/src/features/authentication/controllers/appointmentcontroller.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:health_first/src/features/authentication/screens/hospital_page/hospital_page.dart';
import 'package:health_first/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:health_first/src/constants/colors.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:health_first/src/features/authentication/screens/login/login_screen.dart';
import 'package:health_first/main.dart';
import 'package:velocity_x/velocity_x.dart';
List<Map> doctors = [
  {
    'img': 'assets/logo/doc2.jpg',
    'doctorName': 'Dr. Naveen Kumar',
    'doctorTitle': 'MBBS,FCPS,MS[USAIM]'
  },
  {
    'img': 'assets/logo/doc5.jpg',
    'doctorName': 'Dr. AISHWARYA REWADKAR',
    'doctorTitle': 'MBBS,DPB,AFIH,MBA'
  },
  {
    'img': 'assets/logo/doc4.jpg',
    'doctorName': 'Dr. BHIMRAO PAWAR',
    'doctorTitle': 'MBBS MD MEDICINE'
  },
  {
    'img': 'assets/logo/doc3.jpg',
    'doctorName': 'Dr. ABHIJEET MORE',
    'doctorTitle': 'BAMS CGO'
  }
];

class HomeTab extends StatelessWidget {
  final void Function() onPressedScheduleCard;

  const HomeTab({
    Key? key,
    required this.onPressedScheduleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor: peachColor;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            UserIntro(),
            SizedBox(
              height: 10,
            ),
            SearchInput(),
            SizedBox(
              height: 20,
            ),
            CategoryIcons(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Appointment Today',
                  style: TextStyle(
                    color: header01,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text(
                    '',
                    style: TextStyle(
                      color: yellow01,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    onPressedScheduleCard;
                  },
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AppointmentCard(
              onTap: onPressedScheduleCard,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Top Doctor',
              style: TextStyle(
                color: header01,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            for (var doctor in doctors)
              TopDoctorCard(
                img: doctor['img'],
                doctorName: doctor['doctorName'],
                doctorTitle: doctor['doctorTitle'],
              )
          ],
        ),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  final String img;
  final String doctorName;
  final String doctorTitle;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: {
            'doctorName': doctorName,
            'doctorTitle': doctorTitle,
          });
        },
        child: Row(
          children: [
            Container(
              color: Colors.grey[300],
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/logo/doc1.jpg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dr Ayush Bilkhiwal',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Dental Specialist',
                              style: TextStyle(color: text01),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: bg02,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: bg03,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

List<Map> categories = [
  {'icon': Icons.bookmark_add_sharp, 'text': 'Appointment'},
  {'icon': Icons.local_hospital, 'text': 'Hospital'},
  {'icon': Icons.car_rental, 'text': 'Ambulance'},
  {'icon': Icons.local_pharmacy, 'text': 'Pill'},
];

// class CategoryIcons extends StatelessWidget {
//   const CategoryIcons({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         for (var category in categories)
//           CategoryIcon(
//             icon: category['icon'],
//             text: category['text'],
//           ),
//       ],
//     );
//   }
// }
class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var category in categories)
          CategoryIcon(
            icon: category['icon'],
            text: category['text'],
            onTap: () => _navigateToCategoryPage(context, category['text']),
          ),
      ],
    );
  }
  void _navigateToCategoryPage(BuildContext context, String categoryName) {
    // Dynamically determine the route name based on the category
    String routeName = '';
    switch (categoryName) {
      case 'Appointment':
        routeName = '/covid19Page';
        break;
      case 'Hospital':
        routeName = '/hospitalPage';
        break;
      case 'Ambulance':
        routeName = '/ambulancePage';
        break;
      case 'Pill':
        routeName = '/pharmacyPage';
        break;
      default:
        routeName = '/defaultCategoryPage';
    }

    // Navigate to the specific page using the determined route name
    Navigator.pushNamed(context, routeName);
  }
  // void _navigateToCategoryPage(BuildContext context, String categoryName) {
  //   // Replace '/categoryDetails' with the actual route name for your category page
  //   Navigator.pushNamed(context, '/categoryDetails', arguments: categoryName);
  // }
}


class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Container(
      decoration: BoxDecoration(
        color: bg01,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  IconData icon;
  String text;

  CategoryIcon({
    required this.icon,
    required this.text,
    required void Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: bg01,
      onTap: () => _navigateToCategoryPage(context, text), // Pass 'text' instead of 'category'

      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: primary,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCategoryPage(BuildContext context, String categoryName) {
    // Dynamically determine the route name based on the category
    String routeName = '';
    switch (categoryName) {
      case 'Appointment':
        routeName = '/covid19Page';
        break;
      case 'Hospital':
        routeName = '/hospitalPage';
        break;
      case 'Ambulance':
        routeName = '/ambulancePage';
        break;
      case 'Pill':
        routeName = '/pharmacyPage';
        break;
      default:
        routeName = '/defaultCategoryPage';
    }

    // Navigate to the specific page using the determined route name
    Navigator.pushNamed(context, routeName);
  }
}


// Part-2
class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: purple02,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13, color: purple01, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Part-1


class UserIntro extends StatelessWidget {
  const UserIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightnessValue == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'MediFirst',
              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.w800),
            ),
            Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              print("Checking");
              // Navigate to the Setting.dart page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsView()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo/profile.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}




    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //
    //   children: [
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: const [
    //         Text(
    //           'Hello',
    //           style: TextStyle(fontWeight: FontWeight.w500),
    //         ),
    //         Text(
    //           'Hariom ',
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //         ),
    //       ],
    //     ),
    //
    //     const CircleAvatar(
    //
    //       backgroundImage: AssetImage('assets/person.jpeg'),
    //     )
    //   ],
    // );
