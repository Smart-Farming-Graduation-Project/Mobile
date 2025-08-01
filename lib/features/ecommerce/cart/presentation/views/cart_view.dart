import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.cartProductsList});
  final List<CartProductModel> cartProductsList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (cartProductsList.isEmpty) {
          return CartCubit()..loadCart();
        } else {
          return CartCubit()..fetchCartProducts();
        }
      },
      child: Scaffold(
        body: CartViewBody(cartProductsList: cartProductsList),
      ),
    );
  }
}
