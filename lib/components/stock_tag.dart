import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StockTag extends StatelessWidget {
  final int value;
  final EdgeInsetsGeometry? margin;
  const StockTag({super.key, required this.value, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: margin,
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 5, right: 8),
      decoration: BoxDecoration(
          color: value > 0 ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/Star-active.svg',
            width: 14,
            height: 14,
          ),
          const SizedBox(width: 4),
          value > 0
              ? Text(
                  'In Stock',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              : Text(
                  'Out of  Stock',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
        ],
      ),
    );
  }
}
