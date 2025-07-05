import 'dart:developer';

import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_input_model.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/cubits/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/cubits/stripe_payment_cubit/stripe_payment_state.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_processing_message.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_error_message.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_success_message.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/validate_payment_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/views/widgets/payment_text_field.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/views/widgets/payment_formatters.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/views/widgets/payment_validators.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          getIt<StripePaymentCubit>().paymentController.clearForm();
          showSuccessMessage(context);
        } else if (state is StripePaymentFailure) {
          showErrorMessage(context, state.message);
        } else if (state is StripePaymentLoading) {
          showProcessingMessage(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: getIt<StripePaymentCubit>().paymentController.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                verticalSpace(16),
                buildCardNumberField(),
                verticalSpace(16),
                buildExpiryAndCvvRow(),
                verticalSpace(16),
                buildCardholderNameField(),
                verticalSpace(24),
                buildPayButton(),
              ],
            ),
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

  Widget buildCardNumberField() {
    return PaymentTextField(
      controller:
          getIt<StripePaymentCubit>().paymentController.cardNumberController,
      label: 'Card Number',
      hint: '1234 5678 9012 3456',
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(19),
        CardNumberFormatter(),
      ],
      validator: PaymentValidators.validateCardNumber,
    );
  }

  Widget buildExpiryAndCvvRow() {
    return Row(
      children: [
        Expanded(
          child: PaymentTextField(
            controller: getIt<StripePaymentCubit>()
                .paymentController
                .expiryDateController,
            label: 'Expiry Date',
            hint: 'MM/YY',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              ExpiryDateFormatter(),
            ],
            validator: PaymentValidators.validateExpiryDate,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: PaymentTextField(
            controller:
                getIt<StripePaymentCubit>().paymentController.cvvController,
            label: 'CVV',
            hint: '123',
            keyboardType: TextInputType.number,
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            validator: PaymentValidators.validateCvv,
          ),
        ),
      ],
    );
  }

  Widget buildCardholderNameField() {
    return PaymentTextField(
      controller: getIt<StripePaymentCubit>()
          .paymentController
          .cardholderNameController,
      label: 'Cardholder Name',
      hint: 'John Doe',
      validator: PaymentValidators.validateCardholderName,
    );
  }

  Widget buildPayButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          if (getIt<StripePaymentCubit>().paymentController.validateForm() &&
              validatePaymentData(
                cardNumber: getIt<StripePaymentCubit>()
                    .paymentController
                    .cardNumberController
                    .text,
                expiryDate: getIt<StripePaymentCubit>()
                    .paymentController
                    .expiryDateController
                    .text,
                cvv: getIt<StripePaymentCubit>()
                    .paymentController
                    .cvvController
                    .text,
                cardholderName: getIt<StripePaymentCubit>()
                    .paymentController
                    .cardholderNameController
                    .text,
              )) {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '1000',
              currency: 'usd',
            );
            log('valid');
            getIt<StripePaymentCubit>().makePayment(
              input: paymentIntentInputModel,
            );
          } else {
            log('invalid');
          }
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
          'Pay Now',
          style: AppTextStyles.font16WhiteBold,
        ),
      ),
    );
  }
}
