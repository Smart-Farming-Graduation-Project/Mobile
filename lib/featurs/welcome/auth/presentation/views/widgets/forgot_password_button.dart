import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/helper/show_forgot_password_dialog.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showForgotPasswordDialog(context);
      },
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot Password ?',
          style: TextStyle(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
