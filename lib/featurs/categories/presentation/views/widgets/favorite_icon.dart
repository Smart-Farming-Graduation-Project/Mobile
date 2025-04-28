import 'package:flutter/material.dart';

import '../../../../../core/models/product_model.dart';


class FavoriteIcon extends StatelessWidget {
  final ProductModel product;
  const FavoriteIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      // onTap: () => context.read<ProductCubit>().toggleFavorite(product.id.toString() ),
      // child: BlocBuilder<ProductCubit, List<ProductModel>>(
      //   builder: (context, state) {
      //     final updatedProduct = state.firstWhere(
      //           (p) => p.id == product.id,
      //       orElse: () => product,
      //     );

      child: Icon(
        product.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
