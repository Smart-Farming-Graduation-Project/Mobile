import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeTitleText extends StatelessWidget {
  const HomeTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.textStyle20BlackBold,
    );
  }
}
