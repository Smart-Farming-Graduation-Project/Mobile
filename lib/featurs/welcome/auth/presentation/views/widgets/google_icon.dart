import 'package:crop_guard/core/theme/assets_data.dart';
import 'package:flutter/material.dart';

class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key, required this.onPressed});

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          AssetsData.google,
          height: 50,
        ));
  }
}
