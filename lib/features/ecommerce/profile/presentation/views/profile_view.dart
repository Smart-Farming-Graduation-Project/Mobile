import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/profile_cubit.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/profile_state.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/information_widget.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/log_out_button.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/profile_view_skeletonizer.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/widgets/setting_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const ProfileViewSkeletonizer();
            }
            if (state is ProfileErrorState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is ProfileSuccessState) {
            return Column(
              spacing: 24,
              children: [
                const Spacer(flex: 1),
                InformationWidget(profile: state.profile),
                 SettingOptionsWidget(
                    name: 'Edit Profile', iconName: Icons.edit,onPressed: (){
                      GoRouter.of(context).push(AppRouter.editProfile,extra: state.profile);
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
            );
          }
          return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
