import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.radius});
 final double radius ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage:  const AssetImage(
          'assets/images/home/profile.png',
        ),
      ),
    );
  }
}
