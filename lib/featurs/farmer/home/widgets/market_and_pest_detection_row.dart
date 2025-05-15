import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/quick_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketAndPestDetectionRow extends StatelessWidget {
  const MarketAndPestDetectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuickCard(
          icon: Icons.store,
          title: 'Market',
          onTap: () {
            GoRouter.of(context).push(AppRouter.market);
          },
        ),
        horizontalSpace(16),
        QuickCard(
            icon: Icons.pest_control_outlined,
            title: 'Pest Detection',
            onTap: () {
              GoRouter.of(context).push(AppRouter.pestDetection);
            }),
      ],
    );
  }
}
