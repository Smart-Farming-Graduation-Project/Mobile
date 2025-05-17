import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_cubit.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..loadCart(),
      child: const Scaffold(
        body: CartViewBody(),
      ),
    );
  }
}