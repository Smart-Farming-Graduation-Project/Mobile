import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.kGrayColor,
          ),
        ),
        Text('Or'),
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.kGrayColor,
          ),
        ),
      ],
    );
  }
}
