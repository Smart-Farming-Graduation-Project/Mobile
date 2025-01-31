import 'package:crop_guard/featurs/cart/manger/cubit/cart_cubit.dart';
import 'package:crop_guard/featurs/cart/manger/cubit/cart_state.dart';
import 'package:crop_guard/featurs/cart/views/widgets/cart_products_view.dart';
import 'package:crop_guard/featurs/cart/views/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartLoadedState) {
          return const CartProductsView();
        } else if (state is CartEmptyState) {
          return const EmptyCart();
        } else if (state is CartErrorState) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
