import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final bool hasShadow;
  final bool darkerShadow;
  final double elevation;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final EdgeInsets paddingValue;
  final BorderRadius borderRadius;
  const CustomListTileWidget(
      {Key? key,
      required this.child,
      this.onTap,
      this.paddingValue = const EdgeInsets.all(20),
      this.onLongPress,
      this.borderRadius = const BorderRadius.all(Radius.circular(10)),
      this.hasShadow = false,
      this.elevation = 10,
      this.darkerShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: hasShadow ? elevation : 0,
      shadowColor: Colors.black.withOpacity(0.05),
      borderRadius: borderRadius,
      child: Material(
        color: Colors.white,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          onLongPress: onLongPress,
          child: Container(
            alignment: Alignment.topLeft,
            padding: paddingValue,
            decoration: BoxDecoration(borderRadius: borderRadius),
            child: child,
          ),
        ),
      ),
    );
  }
}
