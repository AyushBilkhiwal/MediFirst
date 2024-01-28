import 'package:flutter/material.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
class TElevatedButtonTheme{
  TElevatedButtonTheme._();
  static final lightElevatedButtonTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
  static final darkElevatedButtonTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );


}