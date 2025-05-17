import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/widgets/animated_loading_button.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/name_text_form_field.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/phone_number_text_form_field.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/sign_up_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SecondSignUpView extends StatelessWidget {
  const SecondSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<RegisterCubit>();
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is SecondSignUpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.kDangerColor,
            ),
          );
        } else if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Check your email for verification link'),
              backgroundColor: AppColors.kGreenColor,
            ),
          );
          // Navigate to the next page or perform any other action
          GoRouter.of(context).go(AppRouter.signIn);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
          child: Form(
            key: cubit.formKeySecondPage,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(85),
                  const AuthTitle(
                    title: 'Finish Sign Up',
                  ),
                  verticalSpace(16),
                  SignUpImage(cubit: cubit),
                  verticalSpace(40),
                  NameTextFormField(
                    controller: cubit.firstNameController,
                    labelText: 'First Name',
                  ),
                  verticalSpace(15),
                  NameTextFormField(
                    controller: cubit.lastNameController,
                    labelText: 'Last Name',
                  ),
                  verticalSpace(15),
                  PhoneNumberTextFormField(
                    controller: cubit.phoneController,
                  ),
                  verticalSpace(30),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      if (state is SecondSignUpLoadingState) {
                        return const AnimatedLoadingButton();
                      }
                      return AuthButton(
                        text: 'Sign Up',
                        onTap: () {
                          cubit.signUp();
                        },
                      );
                    },
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
