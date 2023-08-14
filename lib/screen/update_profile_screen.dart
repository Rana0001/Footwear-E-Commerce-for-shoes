import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/snackbar.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/repository/user_repo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool _isObsecure = true;
  bool _isObsecure2 = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _pnumberController =
      TextEditingController(text: Constant.user.phoneNumber);
  final TextEditingController _firstNameController =
      TextEditingController(text: Constant.user.firstName);
  final TextEditingController _lastNameController =
      TextEditingController(text: Constant.user.lastName);

  _updateProfile() async {
    User user = User(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      password: _passwordController.text,
      phoneNumber: _pnumberController.text,
    );
    int status = await UserRepositoryImp().updateUser(img, user);

    _showMessage(status);
  }

  _showMessage(int status) {
    if (status > 0) {
      snackBarSuccess(context, 'Account Update Successfully');
    } else {
      snackBarFailed(context, 'Account Update Failed');
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: HexColor("#ffd301"),
        elevation: 0,
        title: Text('Your Profile',
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg',
              color: Colors.white),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey,
                      image: img == null
                          ? DecorationImage(
                              image: NetworkImage(
                                  "${Constant.userImageUrl}${Constant.user.profileURL}"),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: FileImage(
                                img!,
                              ),
                              fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            enableDrag: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(50))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              _browseImage(ImageSource.camera);
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        HexColor("FFB301"))),
                                            icon: const Icon(Icons.camera),
                                            label: const Text("Camera"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              _browseImage(ImageSource.gallery);
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        HexColor("FFB301"))),
                                            icon: const Icon(Icons.photo),
                                            label: const Text("Gallery"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: HexColor("#ffd301").withOpacity(0.9)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Edit',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ]),
                      ),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstNameController.text = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Profile.svg',
                            color: HexColor("#FFB301")),
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      labelText: "First Name",
                      labelStyle: GoogleFonts.poppins(
                          color: HexColor("ffd301"),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      hintText: 'First Name',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    onSaved: (value) {
                      _lastNameController.text = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Profile.svg',
                            color: HexColor("#FFB301")),
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      labelText: "Last Name",
                      labelStyle: GoogleFonts.poppins(
                          color: HexColor("ffd301"),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      hintText: 'Last Name',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _pnumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _pnumberController.text = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: HexColor("FFD301"),
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      labelText: "Phone Number",
                      labelStyle: GoogleFonts.poppins(
                          color: HexColor("ffd301"),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      hintText: 'Phone Number',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    obscureText: _isObsecure,
                    controller: _passwordController,
                    onSaved: (value) {
                      if (value!.isNotEmpty) {
                        _passwordController.text = value;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Lock.svg',
                            color: HexColor("#FFB301")),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObsecure = !_isObsecure;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      labelText: "New Password",
                      labelStyle: GoogleFonts.poppins(
                          color: HexColor("ffd301"),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    obscureText: _isObsecure2,
                    controller: _cpasswordController,
                    onSaved: (value) {
                      if (value!.isNotEmpty) {
                        _cpasswordController.text = value;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Lock.svg',
                            color: HexColor("#FFB301")),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObsecure2 = !_isObsecure2;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      labelText: "Confirm Password",
                      labelStyle: GoogleFonts.poppins(
                          color: HexColor("ffd301"),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_passwordController.text ==
                          _cpasswordController.text) {
                        _updateProfile();
                      } else {
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Password does not match',
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          );
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 34, vertical: 12),
                    backgroundColor: HexColor("#FFB301"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Update',
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
        ),
      ),
    );
  }
}
