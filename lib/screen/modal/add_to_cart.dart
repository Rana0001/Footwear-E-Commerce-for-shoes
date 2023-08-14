import 'package:flutter/material.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/snackbar.dart';
import 'package:footwear/model/add_to_cart.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/repository/cart_repo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AddToCartModal extends StatefulWidget {
  String? title;
  String? price;
  String? color;
  String? size;
  Product? product;
  User? user;
  AddToCartModal(
      {super.key,
      this.title,
      this.price,
      this.color,
      this.size,
      this.product,
      this.user});

  @override
  _AddToCartModalState createState() => _AddToCartModalState();
}

class _AddToCartModalState extends State<AddToCartModal> {
  int _quantity = 1;
  _increment() {
    setState(() {
      _quantity++;
      widget.price =
          (int.parse(widget.price!) + int.parse(Constant.product.price!))
              .toString();
    });
  }

  _decrement() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        widget.price =
            (int.parse(widget.price!) - int.parse(Constant.product.price!))
                .toString();
      }
    });
  }

  _success(int status) {
    if (status > 1) {
      snackBarSuccess(context, "Added to cart");
    } else {
      snackBarFailed(context, "Failed to add to cart");
    }
  }

  _addToCart() async {
    int status = await CartRepositoryImp().addCart(
      AddToCart(
        product: Constant.product,
        quantity: _quantity,
        total: (int.parse(widget.price!)),
        status: 'Pending',
        user: widget.user!,
      ),
    );
    _success(status);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ----------
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 6,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          // Section 1 - increment button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 6),
                child: SizedBox(
                  width: 150,
                  child: Text(
                    '${widget.title}',
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF0A0E2F).withOpacity(0.5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _decrement();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: HexColor('FFB301'),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                    ),
                    child:
                        const Icon(Icons.remove, size: 20, color: Colors.black),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '$_quantity',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _increment();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: HexColor('FFB301'),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Icon(Icons.add, size: 20, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
          // Section 2 - Total and add to cart button
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(4),
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TOTAL', style: GoogleFonts.poppins(fontSize: 10)),
                        Text("रू. ${widget.price}",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: () {
                      _addToCart();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('FFB301'),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
