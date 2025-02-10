import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
          position: badges.BadgePosition.topEnd(top: -5, end: -5),
          badgeContent: const Text("3", style: TextStyle(color: Colors.white, fontSize: 12)),
          child: const Icon(FontAwesomeIcons.solidBell, size: 24),
        ),
        const SizedBox(width: 15),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
          position: badges.BadgePosition.topEnd(top: -5, end: -5),
          badgeContent: const Text("2", style: TextStyle(color: Colors.white, fontSize: 12)),
          child: const Icon(FontAwesomeIcons.solidComment, size: 24),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.ellipsis, size: 25),
        ),
      ],
    );
  }
}
