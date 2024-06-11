import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PPStyle {
  static const Color primaryDark = Color(0xFF9747FF);
  static const Color primaryLight = Color(0xFF5A2A99);
  static const Color textLinkColor = Color(0xFF9747FF);

  static const Color primaryFontColor = Color(0xFF214078);
  static const Color shadow = Color(0x3F000000);
  static const Color inputValue = Color(0x3F000000);

  static const double borderRadius = 10;
  static const double btnHeight = 50;
  static const double blueRadius = 4;

  // Text Styles
  static final TextStyle titleStyle = GoogleFonts.publicSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: primaryFontColor,
    height: 1.2,
  );

  static final TextStyle labelStyle = GoogleFonts.publicSans(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primaryFontColor,
    height: 1.2,
  );

  static final TextStyle valueStyle = GoogleFonts.publicSans(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: inputValue,
    height: 1.2,
  );

  static final TextStyle buttonTextStyle = GoogleFonts.publicSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.2,
  );

  static final TextStyle forgotPasswordStyle = GoogleFonts.publicSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    height: 1.2,
  );

  static final TextStyle textLinkStyle = GoogleFonts.publicSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textLinkColor,
    height: 1.2,
  );
}
