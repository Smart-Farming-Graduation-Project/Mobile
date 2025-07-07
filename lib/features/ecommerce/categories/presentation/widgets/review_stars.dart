import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_rating_cubit/review_rating_cubit.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_rating_cubit/review_rating_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
            BlocBuilder<ReviewRatingCubit, ReviewRatingState>(
              builder: (context, state) {
                if (state is ReviewRatingLoading) {
                  return const Skeletonizer(
                      child: Text(
                    "0.0",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kBlackColor,
                    ),
                  ));
                } else if (state is ReviewRatingLoaded) {
                  return Text(
                    state.reviewRating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kBlackColor,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        const SizedBox(width: 10),
        const Tooltip(
          message: "View Reviews",
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: AppColors.kBlackColor,
          ),
        ),
      ],
    );
  }
}
