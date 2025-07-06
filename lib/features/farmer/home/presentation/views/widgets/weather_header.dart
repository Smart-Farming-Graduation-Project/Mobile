import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/cloud-sunny.svg',
              width: 20.w,
              height: 20.h,
            ),
            horizontalSpace(8),
            Text(
              "Today's Weather",
              style: AppTextStyles.font16TextBlackSemiBold,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.resetPassword);
          },
          child: Text(
            'Details',
            style: AppTextStyles.font14GreenSemiBold,
          ),
        ),
      ],
    );
  }
}
