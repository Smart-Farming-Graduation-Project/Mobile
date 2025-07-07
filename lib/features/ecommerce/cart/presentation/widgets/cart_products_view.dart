import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_state.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/add_address_button.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/cart_item_widget.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/empty_cart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductsView extends StatelessWidget {
  const CartProductsView({super.key, required this.cartProductsList});
  final List<CartProductModel> cartProductsList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          return Column(
            children: [
              _buildCartHeader(state.items.length),
              verticalSpace(16),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: state.items.length,
                  separatorBuilder: (context, index) => verticalSpace(12),
                  itemBuilder: (context, index) => CartItemWidget(
                    cartItem: state.items[index],
                  ),
                ),
              ),
              verticalSpace(16),
              _buildSubtotalSection(state.subTotalPrice),
              verticalSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AddressButton(
                  isAddressSelected: false,
                  subtotalPrice: state.subTotalPrice,
                ),
              ),
              verticalSpace(16),
            ],
          );
        }
        if (state is CartInitialState) {
          return Column(
            children: [
              _buildCartHeader(cartProductsList.length),
              verticalSpace(16),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: cartProductsList.length,
                  separatorBuilder: (context, index) => verticalSpace(12),
                  itemBuilder: (context, index) => CartItemWidget(
                    cartItem: cartProductsList[index],
                  ),
                ),
              ),
              verticalSpace(16),
              _buildSubtotalSection(context
                  .read<CartCubit>()
                  .calculateSubTotalPrice(cartProducts)),
              verticalSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AddressButton(
                  isAddressSelected: false,
                  subtotalPrice: context
                      .read<CartCubit>()
                      .calculateSubTotalPrice(cartProductsList),
                ),
              ),
              verticalSpace(16),
            ],
          );
        }

        if (state is CartLoadingState) {
          return _buildLoadingState();
        }

        return const EmptyCart();
      },
    );
  }

  Widget _buildCartHeader(int itemCount) {
    return Container(
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              '$itemCount ${itemCount == 1 ? 'item' : 'items'}',
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: AppColors.kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtotalSection(double subtotal) {
    return Container(
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
            '${subtotal.toStringAsFixed(2)} EGP',
            style: AppTextStyles.font18BlackBold.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

 
  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: const CircularProgressIndicator(
              strokeWidth: 3,
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.kPrimaryColor),
            ),
          ),
          verticalSpace(16),
          Text(
            'Loading your cart...',
            style: AppTextStyles.font15TextGrayRegular,
          ),
        ],
      ),
    );
  }
}
