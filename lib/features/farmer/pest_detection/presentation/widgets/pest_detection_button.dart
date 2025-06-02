import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PestDetectionButton extends StatelessWidget {
  const PestDetectionButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.horizontalPadding});
  final String text;
  final VoidCallback onTap;
  final double? horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.kPrimaryColor),
          ),
          child: Text(
            text,
            style: AppTextStyles.font20WhiteBold,
          ),
        ));
  }
}
