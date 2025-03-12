import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_divider.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/email_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/social_buttons.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/username_text_form_field.dart';
import 'package:flutter/material.dart';

class FirstSignUpView extends StatelessWidget {
  const FirstSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = getIt<RegisterCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Form(
          key: userCubit.formKeyFirstPage,
          child: ListView(
            children: [
              const CropGuardLogo(),
              const AuthTitle(title: 'Create New Account'),
              EmailTextFormField(
                emailController: userCubit.emailController,
              ),
              const SizedBox(height: 15),
              UsernameTextFormField(
                controller: userCubit.usernameController,
              ),
              const SizedBox(height: 15),
              PasswordTextFormField(
                passwordController: userCubit.passwordController,
              ),
              const SizedBox(height: 15),
              PasswordTextFormField(
                passwordController: userCubit.passwordController,
                isConfirm: true,
                confirmPasswordController: userCubit.confirmPasswordController,
              ),
              const TermsAndConditions(),
              const SizedBox(height: 15),
              AuthButton(
                text: 'Next',
                onTap: () {
                  userCubit.checkEmailAndUsername();
                },
              ),
              const SizedBox(height: 15),
              const AuthDivider(),
              const SocialButtons(isSignInPage: false),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
