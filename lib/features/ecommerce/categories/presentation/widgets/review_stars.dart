import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/views/reviews_screen.dart';

import 'package:flutter/material.dart';

class ReviewStars extends StatelessWidget {
  final int productId;
  final double rating;

  const ReviewStars({
    super.key,
    required this.productId,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Reviews",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(Icons.star, color: AppColors.kYellowColor, size: 20),
            const SizedBox(width: 4),
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.kBlackColor,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Tooltip(
          message: "View Reviews",
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewsScreen(
                    productId: productId,
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: AppColors.kBlackColor,
            ),
          ),
        ),
      ],
    );
  }
}
