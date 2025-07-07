import 'dart:developer';

import 'package:crop_guard/core/helper/global_variables.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_state.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/models/product_model.dart';

class FavoriteIcon extends StatelessWidget {
  final ProductModel? product;
  final FavoriteProductModel? favoriteProduct;

  const FavoriteIcon({
    super.key,
    this.product,
    this.favoriteProduct,
  });

  @override
  Widget build(BuildContext context) {
    final productId = product?.productId ?? favoriteProduct?.productId;

    if (productId == null) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFavorite = _isFavorite(productId.toString(), state);

        return GestureDetector(
          onTap: () => _handleFavoriteTap(context, productId.toString()),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        );
      },
    );
  }

  /// Determines if the product is currently in favorites based on state
  bool _isFavorite(String productId, FavoriteState state) {
    // Check if product exists in the current favorites state
    // This assumes your FavoriteState has a favorites list
    // Adjust based on your actual state structure

    // For now, keeping the original logic as fallback
    final isInGlobalFavorites = favorites.any(
      (element) => element.productId == int.tryParse(productId),
    );

    final isMarkedAsFavorite = favoriteProduct?.isFavorite ?? false;

    return isInGlobalFavorites || isMarkedAsFavorite;
  }

  /// Handles the favorite toggle action
  void _handleFavoriteTap(BuildContext context, String productId) {
    if (product == null) {
      log('Cannot toggle favorite: product is null');
      return;
    }

    final cubit = context.read<FavoriteCubit>();
    final isFavorite = _isFavorite(productId, cubit.state);

    if (isFavorite) {
      log('Removing from favorites: $productId');
      cubit.removeFromFavorites(product!);
    } else {
      log('Adding to favorites: $productId');
      cubit.addToFavorites(product!);
    }
  }
}
