import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme{
  static TextTheme lightTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.black,

      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 24,

      )
  );
  static TextTheme darkTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.white,

      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 24,

      )
  );

}