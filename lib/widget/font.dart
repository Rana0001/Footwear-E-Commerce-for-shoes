import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle googleFont(double fontSize, FontWeight fontWeight,
    {Color? color, double? letterspace}) {
  return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterspace);
}
