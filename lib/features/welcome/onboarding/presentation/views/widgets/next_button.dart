import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class NextButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onPressed;

  const NextButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          100.w,
          45.h,
        ),
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.h,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        isLastPage ? "Get Started" : "Next",
        style: AppTextStyles.font20WhiteBold,
      ),
    );
  }
}
