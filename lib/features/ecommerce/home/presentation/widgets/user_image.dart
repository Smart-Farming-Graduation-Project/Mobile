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
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[300],
        child: ClipOval(
          child: Image.asset(
            'assets/images/home/profile.png',
            fit: BoxFit.cover,
            width: radius * 2,
            height: radius * 2,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.person,
                size: radius,
                color: Colors.grey[700],
              );
            },
          ),
        ),
      ),
    );
  }
}
