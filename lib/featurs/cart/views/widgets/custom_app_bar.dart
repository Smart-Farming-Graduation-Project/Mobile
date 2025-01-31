
import 'package:crop_guard/featurs/cart/manger/models/cart_product.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("My Cart",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${cartProducts.length} items',
            style: const TextStyle(color: Colors.grey, fontSize: 16)),
      ],
    );
  }
}
