import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/otp_cubit/otp_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/otp_cubit/otp_state.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/widgets/crop_guard_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'package:pinput/pinput.dart';

class OTPCodeView extends StatelessWidget {
  const OTPCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OtpCubit();
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                ),
                backgroundColor: AppColors.kDangerColor,
              ),
            );
          } else if (state is OtpSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP successfully verified!'),
                backgroundColor: AppColors.kGreenColor,
              ),
            );
            GoRouter.of(context).go(AppRouter.resetPassword);
          } else if (state is OtpLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Loading...'),
                backgroundColor: AppColors.kGrayColor,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: cubit.formKey,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  spacing: 35,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const CropGuardLogo(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Enter Your OTP Code',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font32),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'We\'ve send the OTP Code to your email',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Pinput(
                      defaultPinTheme: PinTheme(
                        width: 50,
                        height: 50,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 50,
                        height: 50,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      onCompleted: (value) =>
                          cubit.resetPasswordUsingOTP(otpCode: value),
                    ),
                    const Row(
                      children: [
                        Text(
                          'Send A New Code',
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                          ),
                        )
                      ],
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
