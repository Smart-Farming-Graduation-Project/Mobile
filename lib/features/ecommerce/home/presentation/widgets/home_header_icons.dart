import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/cart_icon.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/notification_icon.dart';
import 'package:flutter/material.dart';

class HomeHeaderIcons extends StatelessWidget {
  const HomeHeaderIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NotificationIcon(),
        horizontalSpace(15),
        const CartIcon(),
        horizontalSpace(15),
      ],
    );
  }
}
