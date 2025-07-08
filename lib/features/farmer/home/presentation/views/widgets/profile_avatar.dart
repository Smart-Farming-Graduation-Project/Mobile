import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (getIt<CacheHelper>().getDataString(key: ApiKeys.profileImage) != null) {
          GoRouter.of(context).push(AppRouter.profile);
        }
      },
      child: CircleAvatar(
        radius: 24.r,
        backgroundColor: AppColors.kPrimaryColor,
        child: imageUrl.isNotEmpty
            ? ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 48.r,
                  height: 48.r,
                  fit: BoxFit.cover,
                ),
              )
            : Icon(
                Icons.person,
                color: Colors.white,
                size: 30.sp,
              ),
      ),
    );
  }
}
