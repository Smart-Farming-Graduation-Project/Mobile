import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/log_out_button.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/profile_header_skeletonizer.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/setting_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileViewSkeletonizer extends StatelessWidget {
  const ProfileViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          const ProfileHeaderSkeletonizer(),
           SettingOptionsWidget(name: 'Edit Profile', iconName: Icons.edit, onPressed: () {}),
           SettingOptionsWidget(name: 'Change Password', iconName: Icons.lock_outline, onPressed: () {}),
           SettingOptionsWidget(name: 'Payment Method', iconName: Icons.payment, onPressed: () {}),
           SettingOptionsWidget(name: 'My Orders', iconName: Icons.shopping_cart_outlined, onPressed: () {}),
           SettingOptionsWidget(name: 'Privacy Policy', iconName: Icons.privacy_tip_outlined, onPressed: () {}),
           SettingOptionsWidget(name: 'Terms & Conditions', iconName: Icons.list_alt, onPressed: () {}),
           LogOutButton(buttoncolor: Colors.grey.withValues(alpha: 0.2), buttonwidth: 350, buttonheight: 60, buttontext: 'log out', textcolor: Colors.red),
        ],
      ),
    );
  }
}
