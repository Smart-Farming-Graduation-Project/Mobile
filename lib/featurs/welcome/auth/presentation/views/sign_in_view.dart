import 'package:crop_guard/featurs/welcome/auth/manger/cubits/login_cubit/login_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/social_buttons.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_divider.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/email_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/forgot_password_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/navigate_to_page.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = LoginCubit();
    return BlocProvider(
      create: (context) => userCubit,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: userCubit.formKey,
            child: ListView(
              children: [
                // logo image
                const CropGuardLogo(),
                const SizedBox(
                  height: 10,
                ),
                const AuthTitle(
                  title: 'Welcome Back',
                ),
                const SizedBox(
                  height: 20,
                ),
                EmailTextFormField(emailController: userCubit.emailController),
                const SizedBox(
                  height: 15,
                ),
                PasswordTextFormField(
                    passwordController: userCubit.passwordController),

                const ForgotPasswordButton(),
                const SizedBox(
                  height: 20,
                ),
                AuthButton(
                    text: 'Sign In',
                    onTap: () {
                      userCubit.signIn(context);
                    }),
                const SizedBox(
                  height: 35,
                ),
                const AuthDivider(),
                const SizedBox(
                  height: 10,
                ),
                const SocialButtons(
                  isSignInPage: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                const NavigateToPage(
                  nextPage: 'signUp',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
