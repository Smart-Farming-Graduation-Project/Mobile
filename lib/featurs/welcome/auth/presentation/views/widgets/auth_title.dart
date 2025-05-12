import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.h),
      child: Text(title,
          textAlign: TextAlign.center,
          style: AppTextStyles.font28BlackBold),
    );
  }
}
