import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartProductModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.18,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: AppColors.kDangerColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  splashRadius: 1,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 24.sp,
                    color: AppColors.kWhiteColor,
                  ),
                  onPressed: () {
                    Slidable.of(context)?.close();
                    context
                        .read<CartCubit>()
                        .removeFromCart(cartItem.productId);
                  },
                ),
              ),
            ),
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kCardWhite,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            const BoxShadow(
              color: AppColors.kShadowColor,
              offset: Offset(0, 2),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              _buildProductImage(),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductInfo(),
                    verticalSpace(12),
                    _buildPriceAndQuantity(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          const BoxShadow(
            color: AppColors.kShadowColor,
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.network(
          cartItem.productImage != null
              ? cartItem.productImage!
              : 'https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg',
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.kBackgroundGray,
              child: Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.kGrayColor,
                size: 32.sp,
              ),
            );
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.productName,
          style: AppTextStyles.font16BlackSemiBold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(4),
        Text(
          cartItem.productDescription,
          style: AppTextStyles.font14TextGrayRegular,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildPriceAndQuantity() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "${cartItem.productPrice.toStringAsFixed(2)} EGP",
            style: AppTextStyles.font16BlackBold.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        _buildQuantityControls(),
      ],
    );
  }

  Widget _buildQuantityControls() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.kBackgroundGray,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildQuantityButton(
                icon: Icons.remove,
                onPressed: cartItem.quantity > 1
                    ? () {
                        context.read<CartCubit>().updateCart(
                              cartItem.productId,
                              cartItem.quantity - 1,
                            );
                      }
                    : null,
              ),
              Container(
                width: 40.w,
                alignment: Alignment.center,
                child: Text(
                  cartItem.quantity.toString(),
                  style: AppTextStyles.font16BlackSemiBold,
                ),
              ),
              _buildQuantityButton(
                icon: Icons.add,
                onPressed: () {
                  context.read<CartCubit>().updateCart(
                        cartItem.productId,
                        cartItem.quantity + 1,
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 32.w,
      height: 32.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6.r),
          onTap: onPressed,
          child: Icon(
            icon,
            size: 18.sp,
            color: onPressed != null
                ? AppColors.kPrimaryColor
                : AppColors.kGrayColor,
          ),
        ),
      ),
    );
  }
}
