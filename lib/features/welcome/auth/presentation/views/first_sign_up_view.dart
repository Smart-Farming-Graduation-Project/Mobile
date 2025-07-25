import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/widgets/animated_loading_button.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/auth_divider.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/email_text_form_field.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/navigate_to_page.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/social_buttons.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/username_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstSignUpView extends StatelessWidget {
  const FirstSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = getIt<RegisterCubit>();
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is FirstSignUpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
          child: Form(
            key: userCubit.formKeyFirstPage,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(30),
                  const CropGuardLogo(),
                  const AuthTitle(title: 'Create New Account'),
                  EmailTextFormField(
                    emailController: userCubit.emailController,
                  ),
                  verticalSpace(15),
                  UsernameTextFormField(
                    controller: userCubit.usernameController,
                  ),
                  verticalSpace(15),
                  PasswordTextFormField(
                    passwordController: userCubit.passwordController,
                  ),
                  verticalSpace(15),
                  PasswordTextFormField(
                    passwordController: userCubit.passwordController,
                    isConfirm: true,
                    confirmPasswordController:
                        userCubit.confirmPasswordController,
                  ),
                  const TermsAndConditions(),
                  verticalSpace(15),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      if (state is FirstSignUpLoadingState) {
                        return const AnimatedLoadingButton();
                      }
                      return AuthButton(
                        text: 'Next',
                        onTap: () {
                          userCubit.checkEmailAndUsername();
                        },
                      );
                    },
                  ),
                  verticalSpace(15),
                  const AuthDivider(),
                  const SocialButtons(isSignInPage: false),
                  verticalSpace(25),
                  const NavigateToPage(
                    nextPage: 'signIn',
                  ),
                  verticalSpace(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
