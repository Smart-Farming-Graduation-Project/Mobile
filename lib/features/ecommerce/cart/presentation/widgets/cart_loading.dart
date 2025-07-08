import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/cart_item_widget.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/add_address_button.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartLoading extends StatelessWidget {
  const CartLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        children: [
          // Cart Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: const BoxDecoration(
              color: AppColors.kCardWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kShadowColor,
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.kPrimaryColor,
                  size: 24.sp,
                ),
                horizontalSpace(12),
                Text(
                  'Shopping Cart',
                  style: AppTextStyles.font18BlackSemiBold,
                ),
                const Spacer(),
                Text('5 items', style: AppTextStyles.font14BlackRegular),
              ],
            ),
          ),
          verticalSpace(16),
          // Cart Items List
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 5, // Simulating 5 loading items
              separatorBuilder: (context, index) => verticalSpace(12),
              itemBuilder: (context, index) => CartItemWidget(
                cartItem: cartProducts[0],
              ),
            ),
          ),
          verticalSpace(16),
          // Subtotal Section
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.kCardWhite,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                const BoxShadow(
                  color: AppColors.kShadowColor,
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  color: AppColors.kPrimaryColor,
                  size: 20.sp,
                ),
                horizontalSpace(12),
                Text(
                  'Subtotal:',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const Spacer(),
                Text(
                  '150.00 EGP',
                  style: AppTextStyles.font18BlackBold.copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(16),
          // Address Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const AddressButton(
              isAddressSelected: false,
              subtotalPrice: 150.00,
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
