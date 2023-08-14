import 'package:flutter/material.dart';

class CustomScaffoldBodyWidget extends StatelessWidget {
  final Widget child;
  const CustomScaffoldBodyWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
