import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/google_map/models/checkout_data.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_input_model.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/cubits/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/cubits/stripe_payment_cubit/stripe_payment_state.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_processing_message.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_error_message.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_success_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({
    super.key,
    required this.checkoutData,
  });

  final CheckoutData checkoutData;

  // Delivery fee constant
  static const double deliveryFee = 50.0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          if (getIt<CacheHelper>().getDataString(key: ApiKeys.role) ==
              "Buyer") {
            GoRouter.of(context).go(AppRouter.buyerHome);
          } else if (getIt<CacheHelper>().getDataString(key: ApiKeys.role) ==
              "Farmer") {
            GoRouter.of(context).go(AppRouter.farmerHome);
          }
          showSuccessMessage(context);
        } else if (state is StripePaymentFailure) {
          showErrorMessage(context, state.message);
        } else if (state is StripePaymentLoading) {
          showProcessingMessage(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              verticalSpace(16),
              buildOrderSummary(),
              verticalSpace(24),
              buildPayButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Text(
      'Complete your payment',
      style: AppTextStyles.font18BlackSemiBold,
    );
  }

  Widget buildOrderSummary() {
    final double subtotal = checkoutData.subtotalPrice;
    final double total = subtotal + deliveryFee;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.kGrayColor.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGrayColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          buildInfoRow('Delivery Address', checkoutData.address),
          verticalSpace(12),
          buildPriceRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          verticalSpace(8),
          buildPriceRow('Delivery Fee', '\$${deliveryFee.toStringAsFixed(2)}'),
          verticalSpace(12),
          Divider(
            color: AppColors.kGrayColor.withValues(alpha: 0.3),
            height: 1,
          ),
          verticalSpace(12),
          buildPriceRow(
            'Total',
            '\$${total.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.font14GreyRegular,
        ),
        verticalSpace(4),
        Text(
          value,
          style: AppTextStyles.font14BlackSemiBold,
        ),
      ],
    );
  }

  Widget buildPriceRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.font16BlackSemiBold
              : AppTextStyles.font14GreyRegular,
        ),
        Text(
          amount,
          style: isTotal
              ? AppTextStyles.font16BlackSemiBold
              : AppTextStyles.font14GreyRegular,
        ),
      ],
    );
  }

  Widget buildPayButton() {
    final double total = checkoutData.subtotalPrice + deliveryFee;

    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          PaymentIntentInputModel paymentIntentInputModel =
              PaymentIntentInputModel(
            amount: (total).toInt().toString(),
            currency: 'usd',
          );
          log('valid');
          getIt<StripePaymentCubit>().makePayment(
            input: paymentIntentInputModel,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 0,
        ),
        child: Text(
          'Pay \$${total.toStringAsFixed(2)}',
          style: AppTextStyles.font16WhiteBold,
        ),
      ),
    );
  }
}
