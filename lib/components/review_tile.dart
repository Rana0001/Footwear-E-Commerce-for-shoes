import 'package:flutter/material.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/model/review_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewTile extends StatelessWidget {
  final Review review;
  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Photo
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: NetworkImage(Constant.userImageUrl + review.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Username - Rating - Comments
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username - Rating
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 8,
                          child: Text(
                            '${review.name}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: SmoothStarRating(
                            allowHalfRating: false,
                            size: 16,
                            color: Colors.orange[400],
                            rating: double.parse(review.rating.toString()),
                            borderColor: Colors.orange[400],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Comments
                  Text(
                    '${review.comment}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        height: 150 / 100),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
