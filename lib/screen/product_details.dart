import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/app_bar.dart';
import 'package:footwear/components/product_color.dart';
import 'package:footwear/components/product_item_size.dart';
import 'package:footwear/components/review_tile.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/screen/modal/add_to_cart.dart';
import 'package:footwear/screen/view_product_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetail extends StatefulWidget {
  Product? product;
  ProductDetail({super.key, required this.product});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  PageController productImageSlider = PageController();
  @override
  void initState() {
    super.initState();
    Constant.product = widget.product!;
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product!;

    // print(product);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.only(right: 14),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor("FFB301"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("FFB301"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        print(SelectableCircleColor.value);
                        print(SelectableSized.value);

                        return AddToCartModal(
                          product: Constant.product,
                          color: SelectableCircleColor.value,
                          size: SelectableSized.value,
                          title: product.title,
                          price: product.price,
                          user: Constant.user,
                        );
                      },
                    );
                  },
                  child: Text(
                    'Add To Cart',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - appbar & product image
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // product image
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageViewer(imageUrl: product.images!),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 310,
                  color: Colors.white,
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: productImageSlider,
                    children: List.generate(
                      product.images!.length,
                      (index) => Image.network(
                        Constant.userImageUrl + product.images![index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // appbar
              CustomAppBar(
                title: '${product.title}',
                leftIcon: SvgPicture.asset(
                  'assets/icons/Arrow-left.svg',
                  color: Colors.white,
                ),
                leftOnTap: () {
                  Navigator.of(context).pop();
                },
              ),
              // indicator
              Positioned(
                bottom: 16,
                child: SmoothPageIndicator(
                  controller: productImageSlider,
                  count: product.images!.length,
                  effect: ExpandingDotsEffect(
                    dotColor: HexColor("#FFB301").withOpacity(0.2),
                    activeDotColor: HexColor("#FFB301").withOpacity(0.2),
                    dotHeight: 8,
                  ),
                ),
              ),
            ],
          ),
          // Section 2 - product info
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.title!,
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: Text(
                    'रू.${product.price}',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: HexColor("#FFB301")),
                  ),
                ),
                Text(
                  'Bringing a new look to the ${product.brand} sneaker family, the ${product.brand} One balances everything you love about heritage Nike running with fresh innovations.',
                  style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.7), height: 150 / 100),
                ),
              ],
            ),
          ),
          // Section 3 - Color Picker
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SelectableCircleColor(
                  colors: product.color!,
                  margin: const EdgeInsets.only(top: 12),
                ),
                // Section 4 - Size Picker

                Text(
                  'Size',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SelectableSized(
                  size: product.size!,
                  margin: const EdgeInsets.only(top: 12),
                ),
              ],
            ),
          ),

          // Section 5 - Reviews
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  initiallyExpanded: true,
                  childrenPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  tilePadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  title: Text(
                    'Reviews',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          ReviewTile(review: product.review![index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: 3,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
