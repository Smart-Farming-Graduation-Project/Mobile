import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SensorStatusIndicator extends StatelessWidget {
  const SensorStatusIndicator({
    super.key,
    required this.isOk,
  });

  final bool isOk;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isOk ? Icons.check_circle : Icons.warning,
            size: 14.sp,
            color: _getStatusColor(),
          ),
          horizontalSpace(4),
          Text(
            isOk ? 'Normal' : 'Warning',
            style: AppTextStyles.sensorCardStatus.copyWith(
              color: _getStatusColor(),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    return isOk
        ? AppColors.kSensorCardBackgroundGreen
        : AppColors.kSensorCardBackgroundRed;
  }

  Color _getStatusColor() {
    return isOk ? AppColors.kGreenColor : AppColors.kDangerColor;
  }
}
