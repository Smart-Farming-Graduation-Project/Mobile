import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/cubit/product_cubit.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () => context.read<ProductCubit>().toggleFavorite(product),
        child: Icon(
          product.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}
