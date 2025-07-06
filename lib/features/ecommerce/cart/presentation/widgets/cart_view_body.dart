import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_state.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/cart_loading.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/cart_products_view.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cartProductsList});
  final List<CartProductModel> cartProductsList;

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
          } else if (state is CartInitialState || state is CartLoadedState) {
            return CartProductsView(cartProductsList: cartProductsList);
          } else if (state is CartEmptyState) {
            return const EmptyCart();
          } else if (state is CartErrorState) {
            return Center(child: Text(state.errorMessage));
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
