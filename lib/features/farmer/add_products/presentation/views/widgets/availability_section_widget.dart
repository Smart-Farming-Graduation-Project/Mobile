import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';

class AvailabilitySectionWidget extends StatelessWidget {
  final bool isAvailable;
  final ValueChanged<bool> onChanged;

  const AvailabilitySectionWidget({
    super.key,
    required this.isAvailable,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Availability',
          style: AppTextStyles.font16BlackBold,
        ),
        verticalSpace(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.kGrayColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: AppColors.kGrayColor,
                size: 24.sp,
              ),
              horizontalSpace(12),
              Expanded(
                child: Text(
                  'Available for Sale',
                  style: AppTextStyles.font14BlackRegular,
                ),
              ),
              Switch(
                value: isAvailable,
                onChanged: onChanged,
                activeColor: AppColors.kGreenColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
