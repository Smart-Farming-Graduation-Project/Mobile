import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cloudy',
          style: AppTextStyles.font14TextGrayRegular,
        ),
        horizontalSpace(8),
        Row(
          children: [
            Icon(
              Icons.arrow_upward,
              size: 16.sp,
              color: AppColors.kTextSecondary,
            ),
            Text(
              '40°',
              style: AppTextStyles.font14TextGrayRegular,
            ),
            horizontalSpace(6),
            Icon(
              Icons.arrow_downward,
              size: 16.sp,
              color: AppColors.kTextSecondary,
            ),
            Text(
              '17°',
              style: AppTextStyles.font14TextGrayRegular,
            ),
          ],
        ),
      ],
    );
  }
}
