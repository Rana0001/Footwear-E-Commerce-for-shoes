import 'package:footwear/app/first_screen.dart';
import 'package:footwear/screen/choose_screen.dart';
import 'package:footwear/screen/dashboard_screen.dart';
import 'package:footwear/screen/getstart_screen.dart';
import 'package:footwear/screen/login_screen.dart';
import 'package:footwear/screen/signup_screen.dart';
import 'package:footwear/wearos/wear_login.dart';

var getAppRoutes = {
  FirstScreen.routes: (context) => const FirstScreen(),
  SignupScreen.routes: (context) => const SignupScreen(),
  LoginScreen.routes: (context) => LoginScreen(),
  GetStartScreen.routes: (context) => const GetStartScreen(),
  DashboardScreen.routes: (context) => const DashboardScreen(),
  ChooseScreen.routes: (context) => const ChooseScreen(),
};

var getWearRoutes = {
  WearLogin.routes: (context) => const WearLogin(),
  // WearDashboard.routes: (context) => const WearDashboard(),
};
