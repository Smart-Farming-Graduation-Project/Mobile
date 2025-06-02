import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/information_widget.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/log_out_button.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/setting_options_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 24,
        children: [
          const Spacer(flex: 1),
          const InformationWidget(),
          const SettingOptionsWidget(
              name: 'Edit Profile', iconName: Icons.edit),
          const SettingOptionsWidget(
              name: 'Change Password', iconName: Icons.lock_outline),
          const SettingOptionsWidget(
              name: 'Payment Method', iconName: Icons.payment),
          const SettingOptionsWidget(
              name: 'My Orders', iconName: Icons.shopping_cart_outlined),
          const SettingOptionsWidget(
              name: 'Privacy Policy', iconName: Icons.privacy_tip_outlined),
          const SettingOptionsWidget(
              name: 'Terms & Conditions', iconName: Icons.list_alt),
          const Spacer(flex: 3),
          LogOutButton(
              buttoncolor: Colors.grey.withValues(alpha: 0.2),
              buttonwidth: 350,
              buttonheight: 60,
              buttontext: 'log out',
              textcolor: Colors.red),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
