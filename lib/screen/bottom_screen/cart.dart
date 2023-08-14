import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/cart_list_tile.dart';
import 'package:footwear/repository/cart_repo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text('Your Cart',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Text('List of your products',
                style: GoogleFonts.poppins(
                    fontSize: 12, color: Colors.black.withOpacity(0.5))),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 1))),
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => OrderSuccessPage()));
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            backgroundColor: HexColor("FFB301"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Text(
                  'Checkout',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: 2,
                height: 26,
                color: Colors.white.withOpacity(0.5),
              ),
              Flexible(
                flex: 6,
                child: Text(
                  '$total',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: CartRepositoryImp().getUserCart(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartTile(
                        cart: snapshot.data![index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: snapshot.data!.length,
                  ),
                  // Section 2 - Shipping Information
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 12, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.5), width: 1),
                    ),
                    child: Column(
                      children: [
                        // header
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping information',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: HexColor("FFB301"),
                                  shape: const CircleBorder(),
                                  backgroundColor: HexColor("FFB301"),
                                  elevation: 0,
                                  padding: const EdgeInsets.all(0),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/Pencil.svg',
                                  width: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Name
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: SvgPicture.asset(
                                    'assets/icons/Profile.svg',
                                    width: 18),
                              ),
                              Expanded(
                                child: Text(
                                  'Arnold Utomo',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Address
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: SvgPicture.asset('assets/icons/Home.svg',
                                    width: 18),
                              ),
                              Expanded(
                                child: Text(
                                  '1281 90 Trutomo Street, New York, United States ',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Phone Number
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: SvgPicture.asset(
                                    'assets/icons/Profile.svg',
                                    width: 18),
                              ),
                              Expanded(
                                child: Text(
                                  '${Constant.user.phoneNumber}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Section 3 - Select Shipping method
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.5), width: 1),
                    ),
                    child: Column(
                      children: [
                        // Header
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: HexColor("FFB301"),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          // Content
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Select Shipping method',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 10)),
                                  Text('Official Shipping',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ],
                              ),
                              Text('free delivery',
                                  style: GoogleFonts.poppins(
                                      color: HexColor("FFB301"),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Shipping',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        '3-5 Days',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'रू. 0',
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: HexColor("FFB301")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Subtotal',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        '4 Items',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'रू.$total',
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: HexColor("FFB301")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
