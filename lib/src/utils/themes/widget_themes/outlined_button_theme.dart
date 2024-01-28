import 'package:flutter/material.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
class TOutlinedButtonTheme{
  TOutlinedButtonTheme._();
  static final lightOutlinedButtonTheme=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
  static final darkOutlinedButtonTheme=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );


}