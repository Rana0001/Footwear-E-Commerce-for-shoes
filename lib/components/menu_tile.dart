import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTileWidget extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final Color? iconBackground;
  Color? titleColor;

  MenuTileWidget({
    super.key,
    this.icon,
    this.title,
    this.subtitle,
    this.onTap,
    this.margin,
    this.iconBackground = Colors.orangeAccent,
    this.titleColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
        ),
        child: Row(
          children: [
            // Icon Box
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon,
            ),
            // Info
            Expanded(
              child: (subtitle == null)
                  ? Text(title!,
                      style: GoogleFonts.poppins(
                          color: titleColor, fontWeight: FontWeight.w500))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title!,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 2),
                        Text(subtitle!,
                            style: GoogleFonts.poppins(
                                color: Colors.black54, fontSize: 12)),
                      ],
                    ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
