import 'package:crop_guard/featurs/cart/manger/cart_cubit/cart_cubit.dart';
import 'package:crop_guard/featurs/cart/manger/cart_cubit/cart_state.dart';
import 'package:crop_guard/featurs/cart/views/widgets/cart_item_widget.dart';
import 'package:crop_guard/featurs/cart/views/widgets/checkout_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsView extends StatelessWidget {
  const CartProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) => CartItemWidget(
                    cartItem: state.items[index],
                  ),
                ),
              ),
              const CheckoutSummary(),
            ],
          );
        }
        return const Center(child: Text("Cart is empty or loading..."));
      },
    );
  }
}
