import 'package:crop_guard/featurs/categories/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../categories/manger/cubit/product_cubit.dart';
import '../../../categories/presentation/models/product_model.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Favorites")),
        body: BlocBuilder<ProductCubit, List<ProductModel>>(
          builder: (context, products) {
            final favoriteProducts = products.where((product) => product.isFavorite).toList();

            if (favoriteProducts.isEmpty) {
              return const Center(child: Text("No Favorite Products"));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: favoriteProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ProductItem(product: favoriteProducts[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
