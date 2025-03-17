import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name,
            style: const TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${product.price} EGP',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
         GestureDetector(
           onTap: () {},
           child: Container(
             height: 40,
             width: 40,
             margin: const EdgeInsets.only(left: 10),
             decoration: BoxDecoration(
               color: AppColors.kPrimaryColor,
               borderRadius: BorderRadius.circular(12),
             ),
             child: const Icon(Icons.add,
                      color: AppColors.kWhiteColor, size: 26),
           ),
         ),

          ],
        ),
      ],
    );
  }
}
