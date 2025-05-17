import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProductsCard extends StatelessWidget {
  const MyProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.kPrimaryColor, width: 2.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.seedling,
            color: AppColors.kPrimaryColor,
            size: 40.sp,
          ),
          verticalSpace(10),
          Text(
            'My Products',
            style: AppTextStyles.font18BlackBold,
          ),
          Text(
            '100 products',
            style: AppTextStyles.font14BlackRegular,
          ),
        ],
      ),
    );
  }
}
