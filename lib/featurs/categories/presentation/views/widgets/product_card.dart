import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../manger/cubit/product_cubit.dart';
import '../../models/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.read<ProductCubit>().toggleFavorite(widget.product);
                },
                child: Icon(
                  widget.product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
            Center(
              child: Image.asset(widget.product.image,
                  height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Poppins'),
            ),
            Text(
              widget.product.category,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontFamily: 'Poppins'),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Poppins'),
                ),
                if (quantity > 0) Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (quantity > 0) quantity--;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(Icons.remove,
                                  color: Colors.white, size: 16),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.white, size: 16),
                            ),
                          ),
                        ],
                      ) else GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child:const CircleAvatar(
                          backgroundColor: AppColors.kPrimaryColor,
                          radius: 16,
                          child:  Icon(Icons.add,
                              color: Colors.white, size: 16),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
