import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

snackBarSuccess(BuildContext context, String title) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.lightGreen,
      behavior: SnackBarBehavior.floating,
      content: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      )));
}

snackBarFailed(BuildContext context, String title) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      content: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      )));
}
