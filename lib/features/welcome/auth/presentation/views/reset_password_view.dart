import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/widgets/animated_loading_button.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/reset_password_cubit/reset_password_satate.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = ResetPasswordCubit();
    return Scaffold(
      body: BlocProvider(
        create: (context) => resetPasswordCubit,
        child: BlocListener<ResetPasswordCubit, ResetPasswordSatate>(
          listener: (context, state) {
            if (state is ResetPasswordError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: AppColors.kDangerColor,
                ),
              );
            } else if (state is ResetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password reset successfully!'),
                  backgroundColor: AppColors.kPrimaryColor,
                ),
              );
              // Navigate to the next page or perform any other action
              GoRouter.of(context).go(AppRouter.signIn);
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 60),
            child: Form(
              key: resetPasswordCubit.formKey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  const CropGuardLogo(),
                  const Spacer(
                    flex: 2,
                  ),
                  const AuthTitle(title: 'Reset Password'),
                  PasswordTextFormField(
                    passwordController:
                        resetPasswordCubit.newPasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextFormField(
                    passwordController:
                        resetPasswordCubit.newPasswordController,
                    isConfirm: true,
                    confirmPasswordController:
                        resetPasswordCubit.confirmPasswordController,
                  ),
                  const Spacer(
                    flex: 8,
                  ),
                  BlocBuilder<ResetPasswordCubit, ResetPasswordSatate>(
                    builder: (context, state) {
                      if (state is ResetPasswordLoading) {
                        return const AnimatedLoadingButton();
                      }
                      return AuthButton(
                          onTap: () => resetPasswordCubit.resetPassword(),
                          text: 'Reset Password');
                    },
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
