import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/product_item_skeletonizer.dart';
import 'package:flutter/material.dart';

class ProductGridSkeleton extends StatelessWidget {
  const ProductGridSkeleton({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 20,
    this.mainAxisSpacing = 20,
    this.childAspectRatio = 0.7,
    this.padding = const EdgeInsets.all(12.0),
  });

  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ProductItemSkeletonizer(
      itemCount: itemCount,
      isGrid: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
      padding: padding,
    );
  }
}
