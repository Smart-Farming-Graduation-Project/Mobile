import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/information_widget.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/log_out_button.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/setting_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            spacing: 24,
            children: [
              const Spacer(flex: 1),
              const InformationWidget(),
               SettingOptionsWidget(
                  name: 'Edit Profile', iconName: Icons.edit,onPressed: (){
                    GoRouter.of(context).push(AppRouter.editProfile);
                  }),
              SettingOptionsWidget(
                  name: 'Change Password', iconName: Icons.lock_outline,onPressed: (){}),
              SettingOptionsWidget(
                  name: 'Payment Method', iconName: Icons.payment, onPressed: () {  },),
               SettingOptionsWidget(
                  name: 'My Orders', iconName: Icons.shopping_cart_outlined, onPressed: () {  },),
               SettingOptionsWidget(
                  name: 'Privacy Policy',
                  iconName: Icons.privacy_tip_outlined, onPressed: () {  },),
              SettingOptionsWidget(
                  name: 'Terms & Conditions', iconName: Icons.list_alt, onPressed: () {  },),
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
