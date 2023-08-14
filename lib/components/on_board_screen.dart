import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/app/dimension.dart';
import 'package:footwear/screen/getstart_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentPage = 0;
  List<Map<String, String>> swipeData = [
    {
      "subtitle":
          "Elevate Your Footwear Game - Discover Your Next Favorite Pair",
      "image": "assets/images/onboard/onboard1.svg"
    },
    {
      "subtitle": "Find Your Perfect Fit: Shop Our Wide Selection of Shoes",
      "image": "assets/images/onboard/onboard2.svg"
    },
    {
      "subtitle": "Step into Style with Our Top-Pick Shoes!",
      "image": "assets/images/onboard/onboard3.svg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: swipeData.length,
                  itemBuilder: (context, index) => SwipeScreen(
                      subtitle: swipeData[index]['subtitle'],
                      image: swipeData[index]['image']),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          swipeData.length, (index) => dots(index: index)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Swipe Left or Right",
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(
                      Icons.swipe,
                      color: Colors.grey,
                      size: 60,
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const GetStartScreen()),
                              (route) => false);
                        },
                        height: 50,
                        minWidth: 200,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        animationDuration: const Duration(milliseconds: 500),
                        color: HexColor("#FFB301"),
                        child: Text("Continue",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Spacer()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer dots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
          color: currentPage == index ? Colors.amber : HexColor("#e5e5e5"),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

class SwipeScreen extends StatelessWidget {
  const SwipeScreen({
    Key? key,
    required this.subtitle,
    required this.image,
  }) : super(key: key);
  final String? subtitle;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "Footwear Inventory",
          style: GoogleFonts.poppins(
              fontSize: 28,
              color: HexColor("#FFB301"),
              fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle!,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(color: Colors.grey),
        ),
        const Spacer(
          flex: 2,
        ),
        SvgPicture.asset(
          image!,
          height: height(context) / 3,
          fit: BoxFit.contain,
        )
      ],
    );
  }
}
