import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_first/src/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:health_first/src/utils/themes/widget_themes/outlined_button_theme.dart';
import 'package:health_first/src/utils/themes/widget_themes/text_field_theme.dart';
import 'package:health_first/src/utils/themes/widget_themes/text_theme.dart';
class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TTextFormfieldTheme.lightInputDecorationTheme,
      );
  static ThemeData darkTheme=ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TTextFormfieldTheme.darkInputDecorationTheme,
  );
}

