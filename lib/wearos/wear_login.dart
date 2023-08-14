import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footwear/repository/user_repo.dart';
import 'package:footwear/wearos/wear_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wear/wear.dart';

class WearLogin extends StatefulWidget {
  const WearLogin({super.key});
  static const String routes = "/wear_login";
  @override
  State<WearLogin> createState() => _WearLoginState();
}

class _WearLoginState extends State<WearLogin> {
  @override
  final _globalKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _nextPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const WearDashboard()),
        (route) => false);
    Fluttertoast.showToast(
        msg: "Login Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _signIn() async {
    final isLogin = await UserRepositoryImp()
        .login(_usernameController.text, _passwordController.text);

    if (isLogin) {
      setState(() {
        _nextPage();
      });
    } else {
      setState(() {
        Fluttertoast.showToast(
            msg: "Login Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WatchShape(builder: (context, shape, child) {
      return AmbientMode(builder: (context, mode, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                    const Divider(),
                    const Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Username",
                          hintStyle: const TextStyle(fontSize: 12),
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 15,
                          )),
                      onChanged: (value) {
                        _usernameController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Password",
                          hintStyle: const TextStyle(fontSize: 12),
                          prefixIcon: const Icon(
                            Icons.password,
                            size: 15,
                          )),
                      onChanged: (value) {
                        _passwordController.text = value;
                      },
                    ),
                    Center(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: HexColor("#FFC107"),
                        onPressed: () {
                          setState(() {
                            _signIn();
                          });
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      });
    });
  }
}
