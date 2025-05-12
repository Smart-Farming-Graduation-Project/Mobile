import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/role_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/button_decoration.dart';
import '../../manger/cubits/register_cubit/register_cubit.dart';
import '../../manger/cubits/register_cubit/register_state.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(flex: 13),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Your \nAccount Type',
                  style: AppTextStyles.font28BlackBold,
                ),
              ),
            ),
            const Spacer(flex: 2),
            const RoleIcons(),
            const Spacer(flex: 9),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (state is RegisterRoleSelectedState) {
                      context.read<RegisterCubit>().goToFirstSignUpPage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a role'),
                          backgroundColor: AppColors.kDangerColor,
                        ),
                      );
                    }
                  },
                  child: ButtonDecoration(
                    buttonwidth: 130,
                    buttontext: 'Next',
                    buttoncolor: state is RegisterRoleSelectedState
                        ? AppColors.kPrimaryColor
                        : AppColors.kGrayColor,
                  ),
                );
              },
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
