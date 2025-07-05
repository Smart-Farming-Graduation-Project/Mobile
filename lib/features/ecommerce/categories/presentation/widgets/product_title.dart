import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitle extends StatelessWidget {
  final String name;
  final String category;

  const ProductTitle({super.key, required this.name, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyles.font24BlackRegular.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 26.sp,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.kPrimaryColor.withValues(alpha:0.3),
              width: 1,
            ),
          ),
          child: Text(
            category,
            style: AppTextStyles.font14GreenSemiBold.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
