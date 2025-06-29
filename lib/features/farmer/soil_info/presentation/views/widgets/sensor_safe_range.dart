import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SensorSafeRange extends StatelessWidget {
  const SensorSafeRange({
    super.key,
    required this.safeRange,
    required this.unit,
  });

  final String safeRange;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.kSensorCardSafeRangeBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 14.sp,
                color: AppColors.kSensorCardInfoIcon,
              ),
              horizontalSpace(6),
              Text(
                'Safe Range: $safeRange $unit',
                style: AppTextStyles.sensorCardSafeRange,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
