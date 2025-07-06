import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

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
          getIt<CacheHelper>().getDataString(key: ApiKeys.username) ??
              'unknown user',
          style: AppTextStyles.font18BlackSemiBold,
        ),
      ],
    );
  }
}
