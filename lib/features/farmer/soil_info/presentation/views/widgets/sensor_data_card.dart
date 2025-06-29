import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'sensor_card_header.dart';
import 'sensor_value_display.dart';
import 'sensor_safe_range.dart';

class SensorDataCard extends StatelessWidget {
  const SensorDataCard({
    super.key,
    required this.title,
    required this.value,
    this.unit = '',
    this.safeRange,
    required this.isOk,
  });

  final String title;
  final String value;
  final String unit;
  final bool isOk;
  final String? safeRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: _buildCardDecoration(),
      child: Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SensorCardHeader(
              title: title,
              isOk: isOk,
            ),
            verticalSpace(12),
            SensorValueDisplay(
              value: value,
              unit: unit,
              isOk: isOk,
            ),
            if (safeRange != null)
              SensorSafeRange(
                safeRange: safeRange!,
                unit: unit,
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.kSensorCardGradientStart,
          AppColors.kSensorCardGradientEnd,
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.kSensorCardShadow,
          blurRadius: 12.r,
          offset: Offset(0, 4.h),
          spreadRadius: 0,
        ),
      ],
      border: Border.all(
        color: _getBorderColor(),
        width: 1.5.w,
      ),
    );
  }

  Color _getBorderColor() {
    return isOk
        ? AppColors.kSensorCardBorderGreen
        : AppColors.kSensorCardBorderRed;
  }
}
