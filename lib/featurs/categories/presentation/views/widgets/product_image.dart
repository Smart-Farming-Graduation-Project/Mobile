import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              'https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg', // a fallback image URL

              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
