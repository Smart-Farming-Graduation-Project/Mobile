import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: getIt<CacheHelper>().getDataString(key: ApiKeys.profileImage) !=
                null
            ? Image.network(
                getIt<CacheHelper>().getDataString(key: ApiKeys.profileImage)!,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.person,
                size: radius * 1.2,
                color: AppColors.kWhiteColor,
              ),
      ),
    );
  }
}
