import 'package:flutter/material.dart';
import 'package:footwear/components/custom_tile_widget.dart';

class ProductListTileWithOutOfStock extends StatelessWidget {
  const ProductListTileWithOutOfStock({
    Key? key,
    required this.isOutOfStock,
    required this.productImage,
    required this.productName,
    required this.productItemNumber,
    this.outOfStockGestureOnTap,
    required this.outOfStockToggleOnTap,
    this.onTap,
  }) : super(key: key);

  final bool isOutOfStock;
  final ImageProvider<Object> productImage;
  final String productName;
  final int productItemNumber;
  final void Function()? onTap;
  final void Function()? outOfStockGestureOnTap;
  final void Function(bool) outOfStockToggleOnTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        hasShadow: true,
        darkerShadow: isOutOfStock,
        paddingValue: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image:
                      DecorationImage(image: productImage, fit: BoxFit.cover)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$productItemNumber items',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: outOfStockGestureOnTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isOutOfStock
                            ? Text(
                                'Out of stock',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w500),
                              )
                            : Text(
                                'In stock',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500),
                              ),
                        const SizedBox(height: 8),

                        /* <---- Remember me toggle button ----> */
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
