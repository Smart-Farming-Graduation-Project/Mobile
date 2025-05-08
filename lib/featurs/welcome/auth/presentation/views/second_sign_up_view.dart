import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/widgets/animated_loading_button.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/auth_title.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/name_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/phone_number_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Form(
            key: cubit.formKeySecondPage,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  // const CropGuardLogo(),
                  const AuthTitle(
                    title: 'Finish Sign Up',
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cubit.pickUserImage();
                        },
                        child: BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200], 
                                image: cubit.imageFile != null
                                    ? DecorationImage(
                                        image: FileImage(cubit.imageFile!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: cubit.imageFile != null
                                  ? null
                                  : const Icon(
                                      Icons.person,
                                      size: 70,
                                      color: Colors.grey,
                                    ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.kGreenColor,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            cubit.pickUserImage();
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  NameTextFormField(
                    controller: cubit.firstNameController,
                    labelText: 'First Name',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NameTextFormField(
                    controller: cubit.lastNameController,
                    labelText: 'Last Name',
                  ),
                  const SizedBox(height: 15),
                  PhoneNumberTextFormField(
                    controller: cubit.phoneController,
                  ),

                  // const TermsAndConditions(),
                  const SizedBox(height: 30),
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
