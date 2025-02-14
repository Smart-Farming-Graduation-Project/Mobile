import 'package:flutter/material.dart';
import '../../models/category_model.dart';
class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.imageUrl, height: 50),
            Text(category.categoryName),
          ],
        ),
      ),
    );
  }
}
