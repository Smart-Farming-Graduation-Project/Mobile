import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/featurs/ecommerce/cart/manger/address_sheet_cubit/address_sheet_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/cart/manger/cart_cubit/cart_cubit.dart';
import 'package:crop_guard/featurs/ecommerce/cart/manger/cart_cubit/cart_state.dart';
import 'package:crop_guard/featurs/ecommerce/cart/views/widgets/select_address_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(128),
              offset: const Offset(0, 5),
              spreadRadius: 6,
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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  builder: (context) => BlocProvider(
                    create: (context) =>
                        AddressSheetCubit()..loadSavedAddress(),
                    child: const SelectAddressSheet(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )
          ],
        ));
  }
}
