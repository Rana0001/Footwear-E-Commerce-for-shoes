import 'package:flutter/material.dart';
import 'package:footwear/app/dimension.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget mobileLayout;
  final Widget tabletLayout;

  ResponsiveLayout({required this.mobileLayout,required this.tabletLayout});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints){
        if(constraints.maxWidth < mobileDimension ){
          return mobileLayout;
        }else{
          return tabletLayout;
        }
    });
  }
}