
import 'package:crop_guard/featurs/cart/manger/models/cart_product.dart';
import 'package:crop_guard/featurs/cart/views/widgets/cart_item_widget.dart';
import 'package:crop_guard/featurs/cart/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartProductsView extends StatelessWidget {
  const CartProductsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const CustomAppBar(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) => CartItemWidget(
                cartItem: cartProducts[index],
              ),
            ),
          ),
          // CheckoutSummary(),
      
        ],
      ),
    );
  }
}
