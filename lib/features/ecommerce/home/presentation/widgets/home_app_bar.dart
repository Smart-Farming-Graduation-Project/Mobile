import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_header_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, top: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          horizontalSpace(10),
          const UserImage(
            radius: 24,
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hello,',
                style: AppTextStyles.font14GreyRegular,
              ),
              Text(
                userName,
                style: AppTextStyles.font20BlackBold,
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          const HomeHeaderIcons(),
        ],
      ),
    );
  }
}
