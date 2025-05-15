import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/featurs/farmer/home/widgets/quick_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatBotAndSoilInfoRow extends StatelessWidget {
  const ChatBotAndSoilInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const QuickCard(icon: FontAwesomeIcons.robot, title: 'Chat Bot'),
        horizontalSpace(16),
        const QuickCard(icon: FontAwesomeIcons.chartLine, title: 'Soil Info'),
      ],
    );
  }
}
