import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/user_image.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 10,
          ),
          const UserImage(
            radius: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hello,',
                style: AppTextStyles.textStyle14GreyRegular,
              ),
              Text(
                userName,
                style: AppTextStyles.textStyle20BlackBold,
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
