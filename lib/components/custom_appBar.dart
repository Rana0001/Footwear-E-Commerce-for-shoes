import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/components/custom_icon_button_product.dart';

class CoreWidgets {
  /// Custom app bar widget
  static AppBar appBarWidget(
      {required BuildContext screenContext,
      Widget? titleWidget,
      List<Widget>? actions,
      bool hasBackButton = false}) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: hasBackButton
          ? Center(
              child: CustomIconButtonProductWidget(
                  onTap: () {
                    Navigator.pop(screenContext);
                  },
                  hasShadow: true,
                  child: SvgPicture.asset(
                    "assets/icons/Arrow-left.svg",
                    color: Colors.black,
                    height: 18,
                    width: 18,
                  )),
            )
          : null,
      title: titleWidget,
      actions: actions,
    );
  }
}
