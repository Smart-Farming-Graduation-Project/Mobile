import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Text(title,
          textAlign: TextAlign.center,
          style: AppTextStyles.font32.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
