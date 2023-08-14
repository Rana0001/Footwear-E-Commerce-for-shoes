import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:footwear/components/on_board_screen.dart';
import 'package:footwear/screen/login_screen.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  bool? isSkiped;
  SplashScreen({super.key, this.isSkiped});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? username;
  String? password;
  bool? rememberMe;
  String? fingerprint;
  _getDataFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    password = prefs.getString("password");
    rememberMe = prefs.getBool("rememberMe");
    fingerprint = prefs.getString("fingerprint");

    rememberMe ??= false;
    fingerprint ??= "Not Authorized";
  }

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPref();
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        a = true;
      });
    });
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        b = true;
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        c = true;
      });
    });
    Timer(const Duration(milliseconds: 1900), () {
      setState(() {
        e = true;
      });
    });
    Timer(const Duration(milliseconds: 3600), () {
      setState(() {
        d = true;
      });
    });

    Timer(const Duration(milliseconds: 4050), () {
      setState(() {
        widget.isSkiped!
            ? Navigator.of(context).pushReplacement(
                ThisIsFadeRoute(
                  route: LoginScreen(
                      password: password,
                      username: username,
                      rememberMe: rememberMe,
                      fingerprint: fingerprint),
                ),
              )
            : Navigator.of(context).pushReplacement(
                ThisIsFadeRoute(
                  route: const OnBoardScreen(),
                ),
              );
      });
    });
  }

  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
  bool e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: d ? 900 : 2500),
              curve: d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: d
                  ? 0
                  : a
                      ? h / 2
                      : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: d
                      ? 1
                      : c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: d
                  ? h
                  : c
                      ? 80
                      : 20,
              width: d
                  ? w
                  : c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: b ? Colors.white : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: Center(
                child: e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Footwear Inventory',
                            textAlign: TextAlign.center,
                            duration: const Duration(milliseconds: 1700),
                            textStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  Widget? page;
  Widget? route;

  ThisIsFadeRoute({this.page, this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
