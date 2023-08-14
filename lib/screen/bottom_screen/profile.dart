import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/menu_tile.dart';
import 'package:footwear/components/profile_app_bar.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/screen/login_screen.dart';
import 'package:footwear/screen/update_profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  _logout() async {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Logout Success',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {
        Constant.user = User();
        Navigator.pushReplacementNamed(context, LoginScreen.routes);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        cartValue: 2,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture - Username - Name
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // Profile Picture
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                          "${Constant.userImageUrl}${Constant.user.profileURL}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Fullname
                Container(
                  margin: const EdgeInsets.only(bottom: 4, top: 14),
                  child: Text(
                    '${Constant.user.firstName} ${Constant.user.lastName}',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                // Username
                Text(
                  '${Constant.user.email}',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          // Section 2 - Account Menu
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    'ACCOUNT',
                    style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.9),
                        letterSpacing: 6 / 100,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                MenuTileWidget(
                  onTap: () {},
                  margin: const EdgeInsets.only(top: 10),
                  icon: SvgPicture.asset(
                    'assets/icons/Heart.svg',
                    color: Colors.white,
                  ),
                  title: 'Wishlist',
                  subtitle: 'Favorite Products',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Wallet.svg',
                    color: Colors.white,
                  ),
                  title: 'Transactions',
                  subtitle: 'Recent Transactions, Transaction Statement',
                ),
                MenuTileWidget(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Location.svg',
                    color: Colors.white,
                  ),
                  title: 'Address',
                  subtitle: 'Delivery Address, Location',
                ),
              ],
            ),
          ),

          // Section 3 - Settings
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    'SETTINGS',
                    style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.9),
                        letterSpacing: 6 / 100,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                MenuTileWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpdateProfile()));
                  },
                  margin: const EdgeInsets.only(top: 10),
                  icon: SvgPicture.asset(
                    'assets/icons/Filter.svg',
                    color: Colors.white,
                  ),
                  title: 'Update Profile',
                  subtitle: 'Change your details',
                ),
                MenuTileWidget(
                  onTap: () {
                    _logout();
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/Log Out.svg',
                    color: Colors.red,
                  ),
                  iconBackground: Colors.red[100],
                  title: 'Log Out',
                  titleColor: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
