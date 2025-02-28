import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/password_cubit.dart/password_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/terms_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/user_cubit/user_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_divider.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/email_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/name_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/navigate_to_page.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/social_buttons.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = UserCubit(DioConsumer(dio: Dio()));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userCubit,
        ),
        BlocProvider(
          create: (context) => PasswordCubit(),
        ),
        BlocProvider(
          create: (context) => TermsAndConditionsCubit(),
        )
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Form(
            key: userCubit.formKey,
            child: ListView(
              children: [
                const CropGuardLogo(),
                const AuthTitle(
                  title: 'Create New Account',
                ),
                EmailTextFormField(
                  emailController: userCubit.emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                NameTextFormField(
                  isUsername: true,
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
                  confirmPasswordController:
                      userCubit.confirmPasswordController,
                ),
                const TermsAndConditions(),
                const SizedBox(height: 15),
                AuthButton(
                  text: 'Sign Up',
                  onTap: () {
                    userCubit.signUp();
                  },
                ),
                const SizedBox(height: 15),
                const AuthDivider(),
                const SocialButtons(isSignInPage: false,),
                const SizedBox(height: 15),
                const NavigateToPage(nextPage: 'signIn'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
