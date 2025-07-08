import 'dart:developer';

import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/product_item_cubit.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'favorite_icon.dart';
import 'product_image.dart';
import 'product_content.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.product, this.favoriteProduct});

  final ProductModel? product;
  final FavoriteProductModel? favoriteProduct;

  @override
  Widget build(BuildContext context) {
    log(product?.productImages.toString() ??
        favoriteProduct?.productImages.toString() ??
        "No product images");
    return BlocProvider(
      create: (context) => ProductItemCubit(),
      child: GestureDetector(
        onTap: () {
          if (product != null) {
            GoRouter.of(context).push(
              AppRouter.productDetails,
              extra: product,
            );
          } else {
            ProductModel product = ProductModel(
              productId: favoriteProduct?.productId ?? 0,
              productName: favoriteProduct?.productName ?? "",
              productDescription: favoriteProduct?.productDescription ?? "",
              productPrice: favoriteProduct?.productPrice ?? 0,
              categoryName: favoriteProduct?.categoryName ?? "",
              productImages: favoriteProduct?.productImages ?? [],
              productAvailability:
                  favoriteProduct?.productAvailability ?? "Sale",
              sellerName: favoriteProduct?.sellerName ?? "",
              isFavorite: favoriteProduct?.isFavorite ?? false,
            );
            GoRouter.of(context).push(
              AppRouter.productDetails,
              extra: product,
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (context) => FavoriteCubit(),
                child: FavoriteIcon(
                    product: product, favoriteProduct: favoriteProduct),
              ),
              ProductImage(
                image: product?.productImages.isNotEmpty ??
                        favoriteProduct?.productImages.isNotEmpty ??
                        false
                    ? product?.productImages[0] ??
                        favoriteProduct?.productImages[0] ??
                        "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg"
                    : "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
              ),
              ProductContent(
                product: product,
                favoriteProduct: favoriteProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
