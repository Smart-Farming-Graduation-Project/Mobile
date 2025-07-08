import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + 2,
      backgroundColor: AppColors.kPrimaryColor,
      child: Icon(
        Icons.person,
        size: radius * 1.2,
        color: AppColors.kWhiteColor,
      ),
    );
  }
}
