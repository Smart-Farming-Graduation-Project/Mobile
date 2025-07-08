import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/product_grid_skeleton.dart';
import 'package:flutter/material.dart';

class PopularProductsSkeleton extends StatelessWidget {
  const PopularProductsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductGridSkeleton(
      itemCount: 6,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.7,
      padding: EdgeInsets.all(12.0),
    );
  }
}
