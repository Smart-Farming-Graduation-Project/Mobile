import 'dart:ui';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/widgets/button_decoration.dart';
import 'package:crop_guard/core/widgets/loading_button.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/forgot_password_dialog_cubit/forgot_password_dialog_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/forgot_password_dialog_cubit/forgot_password_dialog_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => ForgotPasswordDialogCubit(),
        child: Builder(builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
              title: Align(
                alignment: Alignment.center,
                child: Text('Forgot Password',
                    style: AppTextStyles.font24BlackRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kDangerColor)),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  const Text(
                    'Enter your email address to receive a password reset link.',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    getIt<CacheHelper>().getData(key: ApiKeys.email),
                    style: AppTextStyles.font22,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: const ButtonDecoration(
                            buttontext: 'Cancel',
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<ForgotPasswordDialogCubit>()
                                .forgotUsernameOrPasswordUsingOTP();
                          },
                          child: BlocConsumer<ForgotPasswordDialogCubit,
                              ForgotPasswordDialogState>(
                            builder: (context, state) {
                              if (state is LoadingState) {
                                return const LoadingButton();
                              }
                              return const ButtonDecoration(
                                buttontext: 'Next',
                              );
                            },
                            listener: (BuildContext context,
                                ForgotPasswordDialogState state) {
                              if (state is SuccessState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Check your email for the OTP code.'),
                                    backgroundColor: AppColors.kGreenColor,
                                  ),
                                );

                                GoRouter.of(context).go(AppRouter.oTP);
                              } else if (state is ErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.errorMessage),
                                    backgroundColor: AppColors.kDangerColor,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      );
    },
  );
}
