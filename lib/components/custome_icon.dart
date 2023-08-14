import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final int value;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;

  const CustomIconButtonWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 80,
        margin: margin,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 50,
              height: 80,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: HexColor("FFB301"),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: icon,
            ),
            Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.redAccent,
              ),
              child: Text(
                '$value',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
