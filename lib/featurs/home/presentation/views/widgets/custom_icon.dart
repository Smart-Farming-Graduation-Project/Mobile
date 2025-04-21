import 'package:crop_guard/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../notification/views/notification_view.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) {
              return const NotificationView();
            },)
            );
          },
          child: badges.Badge(
            badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.kPrimaryColor),
            position: badges.BadgePosition.topEnd(top: -5, end: -5),
            badgeContent: const Text("0", style: TextStyle(color: Colors.white, fontSize: 12)),
            child: const Icon(FontAwesomeIcons.solidBell, size: 28),
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRouter.cart);
          },
          child: badges.Badge(
            badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.kPrimaryColor),
            position: badges.BadgePosition.topEnd(top: -5, end: -5),
            badgeContent: const Text("4", style: TextStyle(color: Colors.white, fontSize: 12)),
            child: const Icon(Icons.shopping_cart, size: 28),
          ),
        ),
        const SizedBox(width: 15),


      ],
    );
  }
}
