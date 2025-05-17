import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/farmer/home/presentation/widgets/quick_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityAndRoverRow extends StatelessWidget {
  const CommunityAndRoverRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuickCard(
          icon: Icons.people_alt_outlined,
          title: 'Community',
          onTap: () {
            GoRouter.of(context).push(AppRouter.community);
          },
        ),
        horizontalSpace(16),
        QuickCard(
            icon: Icons.sports_esports_outlined,
            title: 'Rover Control',
            onTap: () {
              GoRouter.of(context).push(AppRouter.roverControl);
            }),
      ],
    );
  }
}
