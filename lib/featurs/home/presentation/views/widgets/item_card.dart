import 'package:crop_guard/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../models/recommended_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final RecommendedModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border, color: Colors.red),
            ),
            Center(
              child: Image.asset(item.imageUrlrecommended, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(
              item.namerecommended,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              item.categoryrecommended,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.pricerecommended,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.kPrimaryColor,
                  radius: 16,
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}