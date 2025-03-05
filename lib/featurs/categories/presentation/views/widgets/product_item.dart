import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:crop_guard/featurs/categories/presentation/views/product_detailes.dart';
import 'package:flutter/material.dart';
import 'favorite_icon.dart';
import 'product_image.dart';
import 'product_content.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: widget.product),
        )) ;
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
            FavoriteIcon(product: widget.product),
            ProductImage(image: widget.product.image),
            ProductContent(product: widget.product),
          ],
        ),
      ),
    );
  }
}
