import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:footwear/components/fingerprint_screen.dart';
import 'package:footwear/components/snackbar.dart';
import 'package:footwear/repository/user_repo.dart';
import 'package:footwear/screen/dashboard_screen.dart';
import 'package:footwear/screen/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  String? username;
  String? password;
  bool? rememberMe;
  String? fingerprint;
  LoginScreen(
      {super.key,
      this.username,
      this.password,
      this.rememberMe,
      this.fingerprint});
  static const String routes = "/login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ishidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FingerPrintAuth fingerPrintAuth = const FingerPrintAuth();

  double _screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  final _gap = const SizedBox(
    height: 8,
  );

  _nextPage() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'basic_channel',
            title: 'Login Success',
            body: 'Your Account is Successfully Login in Android App'));
    // Navigator.pushNamed(context, DashboardScreen.routes);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
        (route) => false);
    snackBarSuccess(context, "Login Success");
  }

  _setDataToSharedPref(
      String username, String password, bool rememberMe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", username);
    prefs.setString("password", password);
    prefs.setBool("isRemember", rememberMe);
    prefs.setString("fingerprint", authorized!);
  }

  _removeDataFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    prefs.remove("password");
    prefs.remove("isRemember");
  }

  _signIn() async {
    final isLogin = await UserRepositoryImp()
        .login(_usernameController.text, _passwordController.text);

    if (isLogin) {
      setState(() {
        if (isRemember!) {
          _setDataToSharedPref(
              _usernameController.text, _passwordController.text, true);
        } else {
          _removeDataFromSharedPref();
        }
        _nextPage();
      });
    } else {
      setState(() {
        snackBarFailed(context, "Login Failed");
      });
    }
  }

  bool? isRemember;

  LocalAuthentication auth = LocalAuthentication();

  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;

  String? authorized;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on Exception catch (e) {
      print(e);
      canCheckBiometrics = false;
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on Exception catch (e) {
      print(e);
      availableBiometrics = <BiometricType>[];
    }

    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: false,
          ));
    } on Exception catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      authorized = authenticated ? "Authorized" : "Not Authorized";
      if (widget.username != null && widget.password != null) {
        if (authorized == "Authorized") {
          _signIn();
        }
      } else {
        snackBarFailed(context, "Login Failed");
      }
      print(authorized);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkBiometrics();
    _getAvailableBiometrics();
    _usernameController.text = widget.username ?? '';
    _passwordController.text = widget.password ?? '';
    isRemember = widget.rememberMe ?? false;
    authorized = widget.fingerprint ?? 'Not Authorized';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Sign in',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 12),
                child: Text(
                  'Welcome Back 😁',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Text(
                  'Login your account to continue ',
                  style: GoogleFonts.poppins(
                      color: Colors.grey, fontSize: 16, height: 150 / 100),
                ),
              ),
              TextFormField(
                controller: _usernameController,
                onSaved: (value) {
                  _usernameController.text = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Your Username',
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/Message.svg',
                        color: HexColor("#FFB301")),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: HexColor("#FFB301"), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                autofocus: false,
                obscureText: ishidePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _passwordController.text = value!;
                },
                decoration: InputDecoration(
                  hintText: '**********',
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/Lock.svg',
                        color: HexColor("#FFB301")),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: HexColor("#FFB301"), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ishidePassword = !ishidePassword;
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/Hide.svg',
                        color: HexColor("#FFB301")),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FlutterSwitch(
                          activeColor: HexColor("#FFB301"),
                          height: 25,
                          width: 50,
                          value: isRemember!,
                          onToggle: (value) {
                            setState(() {
                              isRemember = value;
                            });
                          }),
                      const SizedBox(width: 8),
                      Text(
                        'Remember Me',
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 150 / 100),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerRight,
                      ),
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _signIn();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                  backgroundColor: HexColor('#FFB301'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Or Sign in with',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _authenticate,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                  backgroundColor: HexColor('#FFB301'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: Wrap(children: [
                  Text(
                    'Sign in using Bio-metric',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.fingerprint, color: Colors.white),
                ]),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: HexColor('#FFB301'),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
