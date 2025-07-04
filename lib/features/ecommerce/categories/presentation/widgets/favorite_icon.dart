import 'dart:developer';

import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/models/product_model.dart';

class FavoriteIcon extends StatelessWidget {
  final ProductModel product;
  const FavoriteIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product.isFavorite) {
          log('Remove from favorites');
          context.read<FavoriteCubit>().removeFromFavorites(product);
        } else {
          log('Add to favorites');
          context.read<FavoriteCubit>().addToFavorites(product);
        }
      },
      child: Icon(
        product.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
