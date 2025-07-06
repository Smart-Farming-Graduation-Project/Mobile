import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const InfoBox({
    required this.icon,
    required this.text,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: iconColor.withValues(alpha:0.3),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          text,
          style: AppTextStyles.font14BlackSemiBold.copyWith(
            fontSize: 13.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class InfoBoxDetails extends StatelessWidget {
  const InfoBoxDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          const BoxShadow(
            color: AppColors.kShadowColor,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppColors.kPrimaryColor.withValues(alpha:0.1),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const InfoBox(
            icon: Icons.local_shipping,
            text: "\$2.00",
            iconColor: AppColors.kOrangeColor,
          ),
          Container(
            height: 40.h,
            width: 1,
            color: AppColors.kGrayColor.withValues(alpha:0.2),
          ),
          const InfoBox(
            icon: Icons.location_on,
            text: "2.4 km",
            iconColor: AppColors.kPrimaryColor,
          ),
          Container(
            height: 40.h,
            width: 1,
            color: AppColors.kGrayColor.withValues(alpha:0.2),
          ),
          const InfoBox(
            icon: Iconsax.money5,
            text: "No Offer",
            iconColor: AppColors.kDangerColor,
          ),
        ],
      ),
    );
  }
}
