import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:go_router/go_router.dart';

class EmptyProductsWidget extends StatelessWidget {
  const EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80.w,
            color: Colors.grey[400],
          ),
          verticalSpace(24),
          Text(
            'No Products Yet',
            style: AppTextStyles.font20BlackBold,
          ),
          verticalSpace(12),
          Text(
            'You haven\'t added any products yet.\nStart by adding your first product!',
            textAlign: TextAlign.center,
            style: AppTextStyles.font14GreyRegular,
          ),
          verticalSpace(32),
          ElevatedButton.icon(
            onPressed: () {
              GoRouter.of(context).push('/farmer/add-products');
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Your First Product'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kGreenColor,
              foregroundColor: AppColors.kWhiteColor,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
