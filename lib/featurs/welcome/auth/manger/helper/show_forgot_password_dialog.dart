import 'dart:ui';

import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

void showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            content: Text(
              "Verify Your Email Address\n\n\nwe will send the authentication code\n    to the email address you entered.\n                 Do you want to continue?\n",
              style: AppTextStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        );
      },
    );
  }
