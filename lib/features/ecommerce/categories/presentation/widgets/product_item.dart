import 'dart:developer';

import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/product_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'favorite_icon.dart';
import 'product_image.dart';
import 'product_content.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    log(product.productImages.toString());
    return BlocProvider(
      create: (context) => ProductItemCubit(),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.productDetails,
            extra: product,
          );
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
              FavoriteIcon(product: product),
              ProductImage(
                image: product.productImages.isNotEmpty
                    ? product.productImages[0]
                    : "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
              ),
              ProductContent(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
