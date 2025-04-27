import 'package:crop_guard/featurs/categories/presentation/manger/category_cubit/product_cubit.dart';
import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIcon extends StatelessWidget {
  final ProductModel product;
  const FavoriteIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ProductCubit>().toggleFavorite(product.id.toString() ),
      child: BlocBuilder<ProductCubit, List<ProductModel>>(
        builder: (context, state) {
          final updatedProduct = state.firstWhere(
                (p) => p.id == product.id,
            orElse: () => product,
          );

          return Icon(
            updatedProduct.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
