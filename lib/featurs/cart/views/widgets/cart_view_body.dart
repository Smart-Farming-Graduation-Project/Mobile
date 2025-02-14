import 'package:crop_guard/featurs/cart/manger/cubit/cart_cubit.dart';
import 'package:crop_guard/featurs/cart/manger/cubit/cart_state.dart';
import 'package:crop_guard/featurs/cart/views/widgets/cart_loading.dart';
import 'package:crop_guard/featurs/cart/views/widgets/cart_products_view.dart';
import 'package:crop_guard/featurs/cart/views/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const CartLoading();
          }
          if (state is CartLoadedState) {
            return const CartProductsView();
          } else if (state is CartEmptyState) {
            return const EmptyCart();
          } else if (state is CartErrorState) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
