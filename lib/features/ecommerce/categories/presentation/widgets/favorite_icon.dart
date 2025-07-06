import 'dart:developer';

import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/models/product_model.dart';

class FavoriteIcon extends StatelessWidget {
  final ProductModel? product;
  final FavoriteProductModel? favoriteProduct;
  const FavoriteIcon({super.key, this.product, this.favoriteProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product?.isFavorite ?? favoriteProduct?.isFavorite ?? false) {
          log('Remove from favorites');
          context.read<FavoriteCubit>().removeFromFavorites(product!);
        } else {
          log('Add to favorites');
          context.read<FavoriteCubit>().addToFavorites(product!);
        }
      },
      child: Icon(
        product?.isFavorite ?? favoriteProduct?.isFavorite ?? false
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
