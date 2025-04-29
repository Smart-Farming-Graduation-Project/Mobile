import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/ecommerce/reviews/presentation/views/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'rating_bar_widget.dart';
import 'review_decoration_title.dart';
import 'review_text_from_field.dart';

class ReviewInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const ReviewInputWidget({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const ReviewDecorationTitle(
              titleReview: 'Write a Review', sizeText: 24, width: 200),
          const SizedBox(height: 5),
          RatingBarWidget(
            initialRating: 0,
            onRatingUpdate: (double double) {},
          ),
          const SizedBox(height: 10),
          const ReviewTextField(),
          const Center(
            child: SubmitButton(
                buttoncolor: AppColors.kPrimaryColor,
                buttonwidth: 350,
                buttonheight: 50,
                buttontext: 'Submit',
                textcolor: AppColors.kWhiteColor),
          ),
          const SizedBox(height: 10),
          const ReviewDecorationTitle(
              titleReview: 'Reviews', sizeText: 20, width: 100)
        ],
      ),
    );
  }
}
