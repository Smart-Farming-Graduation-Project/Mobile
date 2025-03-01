import 'package:flutter/material.dart';

class FacebookIcon extends StatelessWidget {
  const FacebookIcon({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.facebook,
        color: Color(0xFF0866FF),
        size: 50,
      ),
    );
  }
}
