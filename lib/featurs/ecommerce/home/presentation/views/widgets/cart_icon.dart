import 'package:badges/badges.dart' as badges;
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.cart);
      },
      child: badges.Badge(
        badgeStyle:
            const badges.BadgeStyle(badgeColor: AppColors.kPrimaryColor),
        position: badges.BadgePosition.topEnd(top: -5, end: -5),
        badgeContent: Text("4", style: AppTextStyles.font12WhiteRegular),
        child: const Icon(Icons.shopping_cart, size: 28),
      ),
    );
  }
}
