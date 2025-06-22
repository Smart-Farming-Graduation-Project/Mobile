import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/notification_button.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/profile_avatar.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/widgets/user_info.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfileAvatar(),
        horizontalSpace(12),
        const UserInfo(),
        const Spacer(),
        const NotificationButton(),
      ],
    );
  }
}
