import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/ecommerce/cart/manger/models/cart_product.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kGreenColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("My Cart", style: TextStyle(fontWeight: FontWeight.bold)),
          Text('${cartProducts.length} items',
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }
}
