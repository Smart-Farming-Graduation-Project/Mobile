import 'package:crop_guard/core/widgets/button_decoration.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Form(
        key: cubit.formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 35,
              children: [
                const Spacer(
                  flex: 2,
                ),
                const Text('Enter Your OTP Code',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle32),
                const Text(
                  'We\'ve send the OTP Code to your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
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
                      cubit.resetPasswordUsingOTP(context, otpCode: value),
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
                const ButtonDecoration(
                  buttoncolor: AppColors.kPrimaryColor,
                  buttonheight: 60,
                  buttonwidth: double.infinity,
                  buttontext: 'Verify',
                  textcolor: Colors.white,
                ),
                const Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

