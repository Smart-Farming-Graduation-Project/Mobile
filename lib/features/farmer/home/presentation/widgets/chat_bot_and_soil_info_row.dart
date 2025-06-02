import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/farmer/home/presentation/widgets/quick_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ChatBotAndSoilInfoRow extends StatelessWidget {
  const ChatBotAndSoilInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuickCard(
          icon: FontAwesomeIcons.robot,
          title: 'Chat Bot',
          onTap: () {
            GoRouter.of(context).push(AppRouter.chatBot);
          },
        ),
        horizontalSpace(16),
        QuickCard(
            icon: FontAwesomeIcons.chartLine,
            title: 'Soil Info',
            onTap: () {
              GoRouter.of(context).push(AppRouter.soilInfo);
            }),
      ],
    );
  }
}
