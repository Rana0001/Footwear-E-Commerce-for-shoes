import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/app/dimension.dart';
import 'package:footwear/components/card_item.dart';
import 'package:footwear/components/custome_icon.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/repository/cart_repo.dart';
import 'package:footwear/repository/product_repo.dart';
import 'package:footwear/screen/Cart_page.dart';
import 'package:footwear/screen/explorer_screen.dart';
import 'package:footwear/screen/product_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List indexList = [];
  List<Product>? productList = [];
  int? len;
  _lstProduct() async {
    productList = await ProductRepositoryImp().getAllProduct();
    return productList;
  }

  @override
  void initState() {
    _lstProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: AvatarBar(),
            ),
            const SizedBox(
              height: 12,
            ),
            const SearchBox(),
            const SizedBox(
              height: 20,
            ),
            Explore(context),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductListPage(
                                brandName: "Jordan",
                              )));
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: CircularBrand(image: "assets/images/jordan.png")),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductListPage(
                              brandName: "Nike",
                            )));
                  },
                  child: CircularBrand(
                    image: "assets/images/nike (1).png",
                    name: "Nike",
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductListPage(
                              brandName: "Adidas",
                            )));
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: CircularBrand(
                    image: "assets/images/adidas (1).png",
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TitleWrap(title: "New Arrivals", subtitle: "See More"),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: ProductRepositoryImp().getAllProduct(),
                initialData: const [],
                builder: (context, snapshot) {
                  len = snapshot.data!.length;

                  if (len == 0) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    for (int i = 0; i < 7; i++) {
                      var index = Random().nextInt(len!);
                      indexList.add(index);
                    }
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: List.generate(
                          6,
                          (index) => ItemCard(
                            product: snapshot.data![indexList[index]],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Stack Explore(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: height(context) / 4,
          width: width(context),
          child: Card(
            elevation: 10,
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child:
                Image.asset("assets/images/card_image.png", fit: BoxFit.fill),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 0, 4),
        child: Container(
            height: height(context) / 4.1,
            width: width(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black38,
                      Colors.transparent,
                    ]))),
      ),
      Positioned(
        top: 35,
        left: 20,
        child: SizedBox(
          width: 150,
          child: Text(
            "A workhorse built to help power you",
            textAlign: TextAlign.left,
            overflow: TextOverflow.visible,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Positioned(
          bottom: 30,
          left: 15,
          child: InkWell(
            child: MaterialButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExplorerScreen(
                            lstProduct: productList,
                          )));
                },
                child: Text("Explore Now",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600))),
          ))
    ]);
  }
}

class TitleWrap extends StatelessWidget {
  TitleWrap({
    super.key,
    this.title,
    this.subtitle,
  });
  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(title!,
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
      trailing: TextButton(
        onPressed: () {
          print("View All ->");
        },
        child: Wrap(
          spacing: 2,
          verticalDirection: VerticalDirection.up,
          textDirection: TextDirection.ltr,
          alignment: WrapAlignment.center,
          children: [
            Text(subtitle!,
                style: GoogleFonts.poppins(
                    color: HexColor("FFB301"),
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            Icon(Icons.arrow_right_alt, size: 21, color: HexColor("FFB301"))
          ],
        ),
      ),
    );
  }
}

class AvatarBar extends StatelessWidget {
  const AvatarBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey("avatarBar"),
      child: ListTile(
        trailing: CustomIconButtonWidget(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const OrderPage()));
          },
          value: Constant.cartLength,
          icon: SvgPicture.asset(
            'assets/icons/Bag.svg',
            color: Colors.white,
          ),
        ),
        leading: SizedBox(
          child: Text("Step into your dream\nShoe today!",
              style: GoogleFonts.poppins(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic)),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 4))
                ]),
            width: width(context),
            child: TextFormField(
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 16,
                decorationColor: Colors.white,
              ),
              decoration: InputDecoration(
                  suffixIcon: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: HexColor("FFB301"),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 4))
                        ]),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(18),
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hintText: "Search your shoes",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularBrand extends StatelessWidget {
  CircularBrand({super.key, this.image, this.name});
  String? image;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: name == "Nike" ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset(
        image!,
        height: 50,
        width: 50,
      ),
    );
  }
}
