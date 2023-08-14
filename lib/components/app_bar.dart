import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leftIcon,
    this.leftOnTap,
  });

  final String? title;
  final VoidCallback? leftOnTap;
  final Widget? leftIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 54,
        margin: const EdgeInsets.only(top: 14),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: leftOnTap,
                style: ElevatedButton.styleFrom(
                  foregroundColor: HexColor('#FFB301'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: HexColor('#FFB301').withOpacity(0.7),
                  elevation: 0,
                  padding: const EdgeInsets.all(8),
                ),
                child: leftIcon,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 8 / 10,
              height: 40,
              decoration: BoxDecoration(
                  color: HexColor("#FFB301").withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Text(
                '$title',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
