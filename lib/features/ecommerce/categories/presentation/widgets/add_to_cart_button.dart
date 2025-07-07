import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/add_to_cart_cubit/add_to_cart_state.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/helper/show_error_message.dart';
import 'package:flutter/material.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/product_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCartCubit, AddToCartState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              if (state is ProductAddedToCart) {
                final List<CartProductModel> cartProductsList = [];
                GoRouter.of(context)
                    .push(AppRouter.cart, extra: cartProductsList);
              } else if (state is AddingProductToCartFailure) {
                showErrorMessage(context, state.errorMessage);
              } else {
                context.read<AddToCartCubit>().addProductToCart(product);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_shopping_cart_rounded,
                    color: Colors.white, size: 20),
                horizontalSpace(10),
                Text(state is ProductAddedToCart ? "Go To Cart" : "Add To Cart",
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}
