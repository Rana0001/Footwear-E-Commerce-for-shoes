import 'package:flutter/material.dart';
import 'package:string_to_color/string_to_color.dart';

class SelectableCircleColor extends StatefulWidget {
  final EdgeInsetsGeometry? margin, padding;

  List<String> colors;
  static String? value;
  SelectableCircleColor(
      {super.key, required this.colors, this.margin, this.padding});

  @override
  _SelectableCircleState createState() => _SelectableCircleState();
}

class _SelectableCircleState extends State<SelectableCircleColor> {
  int? _selectedIndex;

  _change(index) {
    SelectableCircleColor.value = widget.colors[index];
    setState(() {
      _selectedIndex = index;
    });
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
          widget.colors.length,
          (index) {
            return InkWell(
              onTap: () {
                _change(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(100)),
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: ColorUtils.stringToColor(widget.colors[index]),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 4,
                      color: (index == _selectedIndex)
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
