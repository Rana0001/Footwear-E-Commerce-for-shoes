import 'package:flutter/material.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/screen/view_product_image.dart';

class ExploreCardWidget extends StatelessWidget {
  final Product data;
  const ExploreCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ImageViewer(imageUrl: data.images!),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(Constant.userImageUrl + data.images![0]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
