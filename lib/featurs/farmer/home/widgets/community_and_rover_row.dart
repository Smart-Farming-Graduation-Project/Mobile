import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/quick_card.dart';
import 'package:flutter/material.dart';

class CommunityAndRoverRow extends StatelessWidget {
  const CommunityAndRoverRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const QuickCard(icon: Icons.people_alt_outlined, title: 'Community'),
        horizontalSpace(16),
        const QuickCard(
            icon: Icons.sports_esports_outlined, title: 'Rover Control'),
      ],
    );
  }
}
