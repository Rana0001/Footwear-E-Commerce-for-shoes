import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/font.dart';

class TableLayoutScreen extends StatefulWidget {
  const TableLayoutScreen({super.key});

  @override
  State<TableLayoutScreen> createState() => _TableLayoutScreenState();
}

class _TableLayoutScreenState extends State<TableLayoutScreen> {
  final _gap = const SizedBox(
    height: 8,
  );
  bool skiped = false;

  _setGetStartSkip(bool skiped) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("skiped", skiped);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset("assets/images/background.png")),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 20,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/shoe.png"),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Wrap(children: [
                  Text(
                    "Footwear Inventory",
                    style: googleFont(
                      22,
                      FontWeight.w600,
                      // Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/images/nike_logo.png",
                        fit: BoxFit.cover),
                  )
                ]),
                _gap,
                SizedBox(
                  height: 50,
                  width: screenWidth / 1.2,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => HexColor("#FFB301")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      skiped = true;
                      _setGetStartSkip(skiped);
                      Navigator.pushNamed(context, "/choose_screen");
                    },
                    child: Text(
                      "Get Start ",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                _gap,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
