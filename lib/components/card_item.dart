import 'package:flutter/material.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/stock_tag.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/screen/product_details.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  Product? product;
  final Color titleColor;
  final Color priceColor;

  ItemCard({
    super.key,
    this.product,
    this.titleColor = Colors.black,
    this.priceColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(product: product!)));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 16 - 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // item details
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 16 - 8,
                    height: MediaQuery.of(context).size.width / 2 - 16 - 8,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: NetworkImage(
                              Constant.userImageUrl + product!.images![0]),
                          fit: BoxFit.cover),
                    ),
                    child: StockTag(value: product!.items!),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${product!.title}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 8),
                    child: Text(
                      'रू.${product!.price}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: priceColor,
                      ),
                    ),
                  ),
                  Text(
                    '${product!.brand}',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
