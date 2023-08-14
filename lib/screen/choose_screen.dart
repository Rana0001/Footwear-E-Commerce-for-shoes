import 'package:flutter/material.dart';
import 'package:footwear/app/dimension.dart';
import 'package:footwear/screen/login_screen.dart';
import 'package:footwear/screen/signup_screen.dart';
import 'package:footwear/widget/font.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});
  static const String routes = "/choose_screen";

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height(context),
              width: width(context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/shoe-min1.webp"),
                    fit: BoxFit.fitHeight,
                    opacity: 0.8),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height(context) / 2.1,
                  ),
                  Text(
                    "Footwear Inventory",
                    style: googleFont(height(context) / 25, FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: height(context) / 50,
                  ),
                  SizedBox(
                    width: width(context) / 1.4,
                    child: Text(
                      '"Discover the ideal footwear for you from our extensive collection of leading shoe brands."',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: height(context) / 52,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: height(context) / 30,
                  ),
                  MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routes);
                      },
                      elevation: 10,
                      height: height(context) / 15,
                      minWidth: width(context) / 1.4,
                      color: HexColor("#FFB301"),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        "Sign in",
                        style: googleFont(height(context) / 50, FontWeight.bold,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: height(context) / 80,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.routes);
                    },
                    elevation: 5,
                    height: height(context) / 15,
                    minWidth: width(context) / 1.4,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      "Register",
                      style: googleFont(height(context) / 50, FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
