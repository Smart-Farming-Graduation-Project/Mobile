import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailExpansion extends StatelessWidget {
  const ProductDetailExpansion({super.key, required this.description });
final String description ;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric( vertical: 8),
      iconColor: AppColors.kPrimaryColor,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      textColor: AppColors.kPrimaryColor,
      collapsedTextColor: AppColors.kBlackColor,
      title: const Text("Product Detail", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,),
          child: Text( description,
            style: TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.7, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16,)
      ],
    );
  }
}
