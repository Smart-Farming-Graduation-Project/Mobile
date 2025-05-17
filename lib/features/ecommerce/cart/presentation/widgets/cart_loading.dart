import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/cart_item_widget.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/checkout_summary.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartLoading extends StatelessWidget {
  const CartLoading({super.key});

  @override
Widget build(BuildContext context) {
    return Skeletonizer(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5, // Simulating 5 loading items
                    itemBuilder: (context, index) => CartItemWidget(
                      cartItem: cartProducts[0], 
                    ),
                  ),
                ),
                const CheckoutSummary(), // Will also be skeletonized
              ],
            ),
          );
  }
}