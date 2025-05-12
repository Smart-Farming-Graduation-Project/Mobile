import 'package:badges/badges.dart' as badges;
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.notifications);
      },
      child: badges.Badge(
        badgeStyle:
            const badges.BadgeStyle(badgeColor: AppColors.kPrimaryColor),
        position: badges.BadgePosition.topEnd(top: -5, end: -5),
        badgeContent: Text("0", style: AppTextStyles.font12WhiteRegular),
        child: const Icon(FontAwesomeIcons.solidBell, size: 28),
      ),
    );
  }
}
