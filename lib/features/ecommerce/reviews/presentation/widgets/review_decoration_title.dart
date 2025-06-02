import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewDecorationTitle extends StatelessWidget {
  const ReviewDecorationTitle(
      {super.key,
      required this.titleReview,
      required this.sizeText,
      required this.width});

  final String titleReview;
  final double sizeText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.kYellowColor.withAlpha(180),
      ),
      child: Center(
        child: Text(
          titleReview,
          style: TextStyle(
              letterSpacing: 1,
              color: AppColors.kBlackColor,
              fontSize: sizeText,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
