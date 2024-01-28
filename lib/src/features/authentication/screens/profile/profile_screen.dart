import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/features/authentication/controllers/otp_controller.dart';
import 'package:health_first/src/features/authentication/controllers/profile_controller.dart';
import 'package:health_first/src/features/authentication/models/user_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:health_first/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:health_first/src/common_widgets/form/form_header_widget.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:health_first/src/features/authentication/screens/profile/terms.dart';
// hospital_page.dart

import 'package:flutter/material.dart';
import 'package:health_first/src/constants/lists.dart';
import 'package:health_first/src/constants/text_strings.dart';

import '../../../../constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:health_first/src/constants/lists.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/src/constants/lists.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/controllers/profile_controller.dart';
import 'package:health_first/src/features/authentication/models/user_model.dart';
import 'package:health_first/src/features/authentication/repository/authentication_repository/authentication_repository.dart';

// hospital_page.dart

import 'package:flutter/material.dart';
import 'package:health_first/src/constants/lists.dart';
import 'package:health_first/src/constants/text_strings.dart';

import '../../../../constants/image_strings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          tSetting,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Image.asset(tWelcomeScreenImage)),
            title: Text(
              "Username",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            subtitle: Text("user_email@gmail.com"),
          ),
          const Divider(),
          ListView(
            shrinkWrap: true,
            children: List.generate(
              settingList.length,
                  (index) {
                return ListTile(
                  onTap: () {
                    if(index== settingList.length-2){
                      Get.to(() => TermsAndConditionsPage());
                    }
                    if (index == settingList.length - 1) {
                      // Logout when the last element is tapped
                      AuthenticationRepository.instance.logout();
                    } else {
                      // Handle other settings item taps
                      // For now, it's just printing a message
                      print("Tapped on ${settingList[index]}");
                    }
                  },
                  leading: Icon(
                    settingListIcon[index],
                    color: Colors.tealAccent[200],
                  ),
                  title: Text(
                    settingList[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
