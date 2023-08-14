import 'package:flutter/material.dart';

class CustomIconButtonProductWidget extends StatelessWidget {
  final void Function()? onTap;
  final Border? border;
  final Widget child;
  final Color backgroundColor;
  final Size fixedSize;
  final Radius borderRadiusRadiusValue;
  final bool isCircleShape;
  final bool hasShadow;
  const CustomIconButtonProductWidget(
      {Key? key,
      this.onTap,
      required this.child,
      this.backgroundColor = Colors.white,
      this.fixedSize = const Size(40, 40),
      this.borderRadiusRadiusValue = const Radius.circular(14),
      this.border,
      this.isCircleShape = false,
      this.hasShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fixedSize.height,
      width: fixedSize.width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          shape: isCircleShape ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              isCircleShape ? null : BorderRadius.all(borderRadiusRadiusValue),
          border: border),
      child: Material(
        color: backgroundColor,
        shape: isCircleShape ? const CircleBorder() : null,
        shadowColor: hasShadow ? Colors.black.withOpacity(0.4) : null,
        elevation: hasShadow ? 8 : 0,
        borderRadius:
            isCircleShape ? null : BorderRadius.all(borderRadiusRadiusValue),
        child: InkWell(
          onTap: onTap,
          customBorder: isCircleShape ? const CircleBorder() : null,
          borderRadius: BorderRadius.all(borderRadiusRadiusValue),
          child: Center(child: child),
        ),
      ),
    );
  }
}
