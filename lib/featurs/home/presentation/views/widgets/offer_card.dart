import 'package:crop_guard/core/utils/responsive/widget_width.dart';
import 'package:flutter/material.dart';

import '../../models/offer_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(offers.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                offers[index].imageUrl,
                fit: BoxFit.cover,
                width: widgetWidth(context: context, width: 280),
              ),
            );
          }),
        ),
      ),
    );
  }
}
