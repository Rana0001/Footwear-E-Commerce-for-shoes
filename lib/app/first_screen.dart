import 'package:flutter/material.dart';
import 'package:footwear/components/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  static const String routes = "/";
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromSharedPref();
  }

  String? username;
  String? password;
  bool isSkiped = false;
  bool? rememberMe;
  _getDataFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    password = prefs.getString("password");
    rememberMe = prefs.getBool("rememberMe");
    if (username != null || password != null || rememberMe != null) {
      setState(() {
        isSkiped = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreen(
      isSkiped: isSkiped,
    ));
  }
}
