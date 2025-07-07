import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello,',
          style: AppTextStyles.font15TextGrayRegular,
        ),
        Text(
          name,
          style: AppTextStyles.font18BlackSemiBold,
        ),
      ],
    );
  }
}
