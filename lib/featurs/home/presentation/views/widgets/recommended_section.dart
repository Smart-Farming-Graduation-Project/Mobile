import 'package:flutter/material.dart';
import '../../../../categories/presentation/models/product_model.dart';
import '../../../../categories/presentation/views/widgets/product_card.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only( top: 10, bottom: 10 , left: 10, right: 10),
            child: SizedBox(
                width: 165,
                child: ProductCard(product: products[index])),
          );
        },
      ),
    );
  }
}
