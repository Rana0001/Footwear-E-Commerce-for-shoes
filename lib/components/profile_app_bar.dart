import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/components/custome_icon_button.dart';
import 'package:footwear/components/search_screen.dart';
import 'package:footwear/screen/Cart_page.dart';
import 'package:hexcolor/hexcolor.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  int? cartValue;

  MainAppBar({
    super.key,
    this.cartValue,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: HexColor("#FFB301"),
      elevation: 0,
      title: Row(
        children: [
          SearchScreen(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => SearchPage(),
              //   ),
              // );
            },
          ),
          CustomIconButtonWidgetSecond(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OrderPage()));
            },
            value: widget.cartValue!,
            margin: const EdgeInsets.only(left: 16),
            icon: SvgPicture.asset(
              'assets/icons/Bag.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
