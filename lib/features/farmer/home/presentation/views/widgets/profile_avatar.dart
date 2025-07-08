import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.profile);
      },
      child: CircleAvatar(
        radius: 24.r,
        backgroundColor: AppColors.kPrimaryColor,
        child: ClipOval(
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 30.sp,
          ),
        ),
      ),
    );
  }
}
