import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PestDetectionImageResult extends StatelessWidget {
  const PestDetectionImageResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.kLightBlackColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Image.network(
          'https://cdn.pixabay.com/photo/2015/04/27/15/01/vegetables-742095_1280.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
