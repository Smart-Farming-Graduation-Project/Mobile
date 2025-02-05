import 'package:crop_guard/core/utils/theme/app_colors.dart';
import 'package:crop_guard/core/utils/theme/app_text_styles.dart';
import 'package:crop_guard/featurs/cart/manger/cubit/cart_cubit.dart';
import 'package:crop_guard/featurs/cart/manger/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Builds the widget tree for the checkout summary view.
///
/// This method returns a widget that represents the summary
/// of items in the cart, including their total cost and any
/// additional checkout information.
class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0, -10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoadedState) {
                  return Text.rich(
                    TextSpan(
                      text: "Subtotal:\n",
                      children: [
                        TextSpan(
                          text: "\$${state.subTotalPrice.toStringAsFixed(2)}",
                          style: AppTextStyles.textStyle16.copyWith(
                              color: AppColors.kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
