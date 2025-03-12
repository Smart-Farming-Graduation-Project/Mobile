import 'package:crop_guard/featurs/welcome/auth/manger/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = ResetPasswordCubit();
    return Scaffold(
      body: BlocProvider(
        create: (context) => resetPasswordCubit,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 60),
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
                passwordController: resetPasswordCubit.newPasswordController,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextFormField(
                passwordController: resetPasswordCubit.newPasswordController,
                isConfirm: true,
                confirmPasswordController:
                    resetPasswordCubit.confirmPasswordController,
              ),
              const Spacer(
                flex: 8,
              ),
              AuthButton(
                  onTap: () => resetPasswordCubit.resetPassword(context),
                  text: 'Reset Password'),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
