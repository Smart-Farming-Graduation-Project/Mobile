import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
