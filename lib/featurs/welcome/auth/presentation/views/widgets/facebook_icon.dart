import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacebookIcon extends StatelessWidget {
  const FacebookIcon({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:  Icon(
        Icons.facebook,
        color: const Color(0xFF0866FF),
        size: 50.h,
      ),
    );
  }
}
