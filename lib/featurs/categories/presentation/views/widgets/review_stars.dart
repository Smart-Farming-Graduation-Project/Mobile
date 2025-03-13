import 'package:crop_guard/core/routing/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReviewStars extends StatelessWidget {
  const ReviewStars({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Review", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const Spacer(),
      Icon(Icons.star,color:  AppColors.kYellowColor),
      const SizedBox( width: 4),
      const Text('4.8', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.kBlackColor)),
      const SizedBox( width: 15),
      GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.review);
        },

          child: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: AppColors.kBlackColor)),
      ],
    );
  }
}
