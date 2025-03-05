import 'package:crop_guard/core/responsive/widget_height.dart';
import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:crop_guard/featurs/categories/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widgetHeight(context: context, height: 230),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
                width: widgetWidth(context: context, width: 153),
                child: ProductItem(product: products[index])),
          );
        },
      ),
    );
  }
}
