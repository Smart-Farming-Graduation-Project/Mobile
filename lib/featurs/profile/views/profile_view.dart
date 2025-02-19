import 'package:crop_guard/featurs/profile/views/widgets/information_widget.dart';
import 'package:crop_guard/featurs/profile/views/widgets/setting_options_widget.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/theme/app_colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kWhiteColor,
        appBar: AppBar(
          title: const Text('My Profile',style: TextStyle(
            color: AppColors.kWhiteColor,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: AppColors.kPrimaryColor,
        ),

        body: Column(
          children: [
           const InformationWidget(),
            const SizedBox(height: 35),

            SettingOptionsWidget(name: 'Edit Profile', iconName: Icons.edit),
            Divider(
              thickness: .3,
              color: Colors.grey,
            ),
            SizedBox(height:  3),
            SettingOptionsWidget(name: 'Change Password', iconName: Icons.lock_outline),
            Divider(
              thickness: .3,
              color: Colors.grey,
            ),
            SizedBox(height:  3),
            SettingOptionsWidget(name: 'Payment Method', iconName: Icons.payment),
            Divider(
              thickness: .3,
              color: Colors.grey,
            ),
            SizedBox(height:  3),
            SettingOptionsWidget(name: 'My Orders', iconName: Icons.shopping_cart_outlined),
            Divider(
              thickness: .3,
              color: Colors.grey,
            ),
            SizedBox(height:  3),
            SettingOptionsWidget(name: 'Privacy Policy', iconName: Icons.privacy_tip_outlined),
            Divider(
              thickness: .3,
              color: Colors.grey,
            ),
            SizedBox(height: 3),
            SettingOptionsWidget(name: 'Terms & Conditions', iconName: Icons.list_alt),
            Divider(
              thickness: .3,
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            CustomButton(buttoncolor: AppColors.kPrimaryColor,
                buttonwidth: 350, buttonheight: 60,
                buttontext: 'log out', textcolor: AppColors.kWhiteColor)
      
      
          ],
        ),
      
      ),
    );
  }
}
