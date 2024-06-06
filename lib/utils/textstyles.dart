import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle appBarTitle = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
  );

  static final TextStyle heading = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: Colors.blue,
    ),
  );

  static final TextStyle bodyText = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );
}
