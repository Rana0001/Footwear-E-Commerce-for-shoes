import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/screen/dashboard_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Shipping Address',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Please! Set up a shipping address first.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autofocus: false,
                  controller: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (newValue) {},
                  decoration: InputDecoration(
                    hintText: 'Address',
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Profile.svg',
                          color: HexColor("#FFB301")),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
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
                const SizedBox(height: 14),
                TextFormField(
                  autofocus: false,
                  controller: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (newValue) {},
                  decoration: InputDecoration(
                    hintText: 'City',
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Profile.svg',
                          color: HexColor("#FFB301")),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
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
                const SizedBox(height: 14),
                TextFormField(
                  autofocus: false,
                  controller: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (newValue) {},
                  decoration: InputDecoration(
                    hintText: 'State',
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Profile.svg',
                          color: HexColor("#FFB301")),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
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
                const SizedBox(height: 14),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const DashboardScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: HexColor('#FFB301'),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                    backgroundColor: HexColor('#FFB301'),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Add Address',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, color: Colors.white),
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
