import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/home/presentation/views/widgets/search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../categories/manger/cubit/product_cubit.dart';
import '../../../categories/presentation/models/product_model.dart';
import '../../../categories/presentation/views/widgets/product_item.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 0,
          title: const Text(
            'Favorite Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          centerTitle: true,

        ),
        body: BlocBuilder<ProductCubit, List<ProductModel>>(
          builder: (context, products) {
            final favoriteProducts =
            products.where((product) => product.isFavorite).toList();

            if (favoriteProducts.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/empty_fav.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "No Favorite Products Yet!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Browse and add your favorite items ❤️",
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(child: SearchBarFilter()),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Symbols.instant_mix,
                            color: AppColors.kPrimaryColor,
                            size: 34,
                          ))
                    ],
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: GridView.builder(
                      itemCount: favoriteProducts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return ProductItem(product: favoriteProducts[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
