import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIconButtonWidgetSecond extends StatelessWidget {
  final Widget icon;
  final int value;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;

  const CustomIconButtonWidgetSecond({
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
        width: 50,
        height: 50,
        margin: margin,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: icon,
            ),
            (value != 0)
                ? Container(
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
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
