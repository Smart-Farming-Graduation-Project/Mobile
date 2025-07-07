import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: const BoxDecoration(
              color: AppColors.kBackgroundGray,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 60.sp,
              color: AppColors.kGrayColor,
            ),
          ),
          verticalSpace(24),
          Text(
            'Your cart is empty',
            style: AppTextStyles.font20BlackBold,
          ),
          verticalSpace(8),
          Text(
            'Add some products to get started',
            style: AppTextStyles.font15TextGrayRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(32),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Start Shopping',
                style: AppTextStyles.font16WhiteSemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
