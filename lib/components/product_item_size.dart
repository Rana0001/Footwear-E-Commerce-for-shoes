import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectableSized extends StatefulWidget {
  final EdgeInsetsGeometry? margin, padding;
  static String? value;
  List<String> size;
  final Color? selectedColor;
  final Color? baseColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? textStyle;

  SelectableSized(
      {super.key,
      required this.size,
      this.selectedColor,
      this.textStyle,
      this.selectedTextStyle,
      this.baseColor,
      this.margin,
      this.padding});

  @override
  _SelectableSizedState createState() => _SelectableSizedState();
}

class _SelectableSizedState extends State<SelectableSized> {
  int? _selectedIndex;

  _change(index) {
    setState(() {
      SelectableSized.value = widget.size[index];
      _selectedIndex = index;
    });
  }

  _getTextStyle(index) {
    if (index == _selectedIndex) {
      if (widget.selectedTextStyle == null) {
        return GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600);
      }
      return widget.selectedTextStyle;
    } else {
      if (widget.textStyle == null) {
        return GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600);
      }
      return widget.textStyle;
    }
  }

  _getBackgroundColor(index) {
    if (index == _selectedIndex) {
      if (widget.selectedColor == null) return HexColor("#FFB301");
      return widget.selectedColor;
    } else {
      if (widget.baseColor == null) return Colors.grey.withOpacity(0.5);
      return widget.baseColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: Wrap(
        spacing: 20,
        runSpacing: 8,
        children: List.generate(
          widget.size.length,
          (index) {
            return InkWell(
              onTap: () {
                _change(index);
                print(widget.size[index]);
              },
              child: Container(
                width: 46,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: _getBackgroundColor(index),
                ),
                child: Text(
                  widget.size[index],
                  style: _getTextStyle(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
