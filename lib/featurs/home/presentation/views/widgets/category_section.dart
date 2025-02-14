import 'package:crop_guard/core/utils/responsive/widget_height.dart';
import 'package:crop_guard/core/utils/responsive/widget_width.dart';
import 'package:flutter/material.dart';

import '../../../../categories/presentation/models/category_model.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.axis});
final String axis;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection:axis == 'horizontal' ? Axis.horizontal : Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: widgetWidth(context: context, width: 120),
                  height: widgetHeight(context: context, height: 100),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(category.imageUrl,
                  width:80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  category.categoryName,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
