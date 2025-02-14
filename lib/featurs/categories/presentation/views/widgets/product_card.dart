import 'package:flutter/material.dart';
import '../../models/product_model.dart';
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onFavoriteToggle;

  const ProductCard({super.key, required this.product, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product.image, height: 80),
          Text(product.name),
          Text('\$${product.price}'),
          IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: product.isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}
