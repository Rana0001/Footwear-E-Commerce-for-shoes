import 'package:flutter/material.dart';
import 'package:footwear/responsive/mobile_layout.dart';

import 'package:footwear/responsive/responsive_layout.dart';
import 'package:footwear/responsive/tablet_layout.dart';

class GetStartScreen extends StatelessWidget {
  static const String routes = "/choose_screen";
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileLayout: const MobileLayoutScreen(),
          tabletLayout: const TableLayoutScreen()),
    );
  }
}
