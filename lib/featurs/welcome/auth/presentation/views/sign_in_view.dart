import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/widgets/animated_loading_button.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/login_cubit/login_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/login_cubit/login_state.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = LoginCubit();
    return BlocProvider(
      create: (context) => userCubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Successful'),
                backgroundColor: AppColors.kGreenColor,
              ),
            );
            if (state.role == "Buyer") {
              GoRouter.of(context).go(AppRouter.home);
            } else {
              GoRouter.of(context).go(AppRouter.community);
            }
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: AppColors.kDangerColor,
              ),
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 30.h,
            ),
            child: Form(
              key: userCubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(30),
                    // logo image
                    const CropGuardLogo(),
                    verticalSpace(10),
                    const AuthTitle(
                      title: 'Welcome Back',
                    ),
                    verticalSpace(20),
                    EmailTextFormField(
                        emailController: userCubit.emailController),
                    verticalSpace(15),
                    PasswordTextFormField(
                        passwordController: userCubit.passwordController),

                    const ForgotPasswordButton(),
                    verticalSpace(20),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const AnimatedLoadingButton();
                        }
                        return AuthButton(
                          text: 'Sign In',
                          onTap: () {
                            context.read<LoginCubit>().signIn();
                          },
                        );
                      },
                    ),
                    verticalSpace(35),
                    const AuthDivider(),
                    verticalSpace(10),
                    const SocialButtons(
                      isSignInPage: true,
                    ),
                    verticalSpace(25),
                    const NavigateToPage(
                      nextPage: 'signUp',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
