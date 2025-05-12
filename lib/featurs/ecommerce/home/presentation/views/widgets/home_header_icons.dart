import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/cart_icon.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/notification_icon.dart';
import 'package:flutter/material.dart';

class HomeHeaderIcons extends StatelessWidget {
  const HomeHeaderIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        NotificationIcon(),
        SizedBox(width: 15),
        CartIcon(),
        SizedBox(width: 15),
      ],
    );
  }
}
