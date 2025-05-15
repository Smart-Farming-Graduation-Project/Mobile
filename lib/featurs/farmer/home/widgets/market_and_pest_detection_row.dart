import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/quick_card.dart';
import 'package:flutter/material.dart';

class MarketAndPestDetectionRow extends StatelessWidget {
  const MarketAndPestDetectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const QuickCard(icon: Icons.store, title: 'Market'),
        horizontalSpace(16),
        const QuickCard(
            icon: Icons.pest_control_outlined, title: 'Pest Detection'),
      ],
    );
  }
}
