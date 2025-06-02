import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<LoginCubit>().forgetPasswordAlert(context);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot Password ?',
          style: AppTextStyles.font16GreenBold,
        ),
      ),
    );
  }
}
