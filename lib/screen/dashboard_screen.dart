import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:footwear/repository/cart_repo.dart';
import 'package:footwear/screen/bottom_screen/cart.dart';
import 'package:footwear/screen/bottom_screen/home.dart';
import 'package:footwear/screen/bottom_screen/product.dart';
import 'package:footwear/screen/bottom_screen/profile.dart';
import 'package:hexcolor/hexcolor.dart';

import '../app/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const String routes = "/dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int lenCart = 0;

  int _index = 0;
  final List<Widget> _listWidget = [
    const HomeScreen(),
    const ProductsScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  final List<Widget> _iconsList = [
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(Icons.shop, size: 30),
    const Icon(
      Icons.shopping_cart,
      size: 30,
    ),
    const Icon(
      Icons.person_sharp,
      size: 30,
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lstCart() async {
      Constant.cart = await CartRepositoryImp().getUserCart();
      setState(() {
        Constant.cartLength = Constant.cart!.length;
      });
      return Constant.cart;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            animationCurve: Curves.fastOutSlowIn,
            color: HexColor("#FFB301"),
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: HexColor("#FFB301"),
            height: 60,
            index: _index,
            items: _iconsList,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
        body: SafeArea(child: _listWidget[_index]));
  }
}
