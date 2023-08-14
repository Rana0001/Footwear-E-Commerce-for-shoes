import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/components/snackbar.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/repository/user_repo.dart';
import 'package:footwear/screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String routes = "/register_screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // late final List<Role> _lstRoles = [];
  // late final String _dropDownValue = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _pnumberController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  double _screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  final _gap = const SizedBox(
    height: 8,
  );
  @override
  void initState() {
    super.initState();
  }

  _showMessage(int status) {
    if (status > 0) {
      Navigator.pushNamed(context, LoginScreen.routes);
      snackBarSuccess(context, 'Account Created Successfully');
    } else {
      snackBarFailed(context, 'Account Create Failed');
    }
  }

  _signupUser() async {
    User user = User(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phoneNumber: _pnumberController.text);
    int status = await UserRepositoryImp().registerUser(img, user);
    print(status);
    _showMessage(status);
  }

  File? img;

  Future _browseImage(ImageSource imageSource) async {
    try {
      // Source is either Gallary or Camera
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool isPasswordInvisible = false;
  bool isCPasswordInvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Sign up',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' Sign in',
                style: GoogleFonts.poppins(
                  color: HexColor("#FFB301"),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            // Section 1 - Header
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 12),
              child: Text(
                'Welcome to Footwear  👋',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: const Text(
                'Create an account to continue',
                style: TextStyle(
                    color: Colors.grey, fontSize: 16, height: 150 / 100),
              ),
            ),
            // Section 2  - Form
            // Full Name
            TextFormField(
              autofocus: false,
              controller: _firstNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
              onSaved: (newValue) {
                _firstNameController.text = newValue!;
              },
              decoration: InputDecoration(
                hintText: 'First Name',
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Profile.svg',
                      color: HexColor("#FFB301")),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#FFB301"), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lastNameController,
              autofocus: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              onSaved: (newValue) {
                _lastNameController.text = newValue!;
              },
              decoration: InputDecoration(
                hintText: 'Last Name',
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Profile.svg',
                      color: HexColor("#FFB301")),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#FFB301"), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            // Username
            TextFormField(
              controller: _usernameController,
              autofocus: false,
              validator: (value) {
                if (value!.isEmpty) {
                  if (value.contains(' ')) {
                    if (value.length < 3) {
                      return 'Username must be at least 3 characters';
                    }
                    return 'Username cannot contain spaces';
                  }
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (newValue) {
                _usernameController.text = newValue!;
              },
              decoration: InputDecoration(
                hintText: 'Username',
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: Text('@',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: HexColor("#FFB301"))),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#FFB301"), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
              ),
            ),
            // Phone Number
            const SizedBox(height: 16),
            TextFormField(
              controller: _pnumberController,
              validator: (value) {
                if (value!.isEmpty) {
                  if (value.length < 10) {
                    return "Phone Should Must Be 10 Digits";
                  }
                  return 'Please enter your phone number';
                }
                return null;
              },
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.phone, color: HexColor("#FFB301")),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#FFB301"), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            // Email
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  if (value.contains(' ')) {
                    return 'Email cannot contain spaces';
                  }
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (newValue) {
                _emailController.text = newValue!;
              },
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email@email.com',
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Message.svg',
                      color: HexColor("#FFB301")),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#FFB301"), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            // Password
            TextFormField(
              controller: _passwordController,
              autofocus: false,
              validator: (value) {
                if (value!.isEmpty) {
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (newValue) {
                _passwordController.text = newValue!;
              },
              obscureText: isPasswordInvisible,
              decoration: InputDecoration(
                hintText: 'Password',
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
                  borderSide: BorderSide(color: HexColor("#FFB301"), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
                //
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordInvisible = !isPasswordInvisible;
                    });
                  },
                  icon: SvgPicture.asset('assets/icons/Hide.svg',
                      color: HexColor("#FFB301")),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Repeat Password
            TextFormField(
              controller: _cpasswordController,
              validator: (value) {
                if (value!.isEmpty) {
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (newValue) {
                _cpasswordController.text = newValue!;
              },
              autofocus: false,
              obscureText: isCPasswordInvisible,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
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
                  borderSide: BorderSide(color: HexColor("#FFB301"), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
                //
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isCPasswordInvisible = !isCPasswordInvisible;
                    });
                  },
                  icon: SvgPicture.asset('assets/icons/Hide.svg',
                      color: HexColor("#FFB301")),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_passwordController.text == _cpasswordController.text) {
                    _signupUser();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Password does not match',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
                backgroundColor: HexColor("#FFB301"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                'Sign up',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
