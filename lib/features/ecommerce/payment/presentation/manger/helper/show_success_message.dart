import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColors.kWhiteColor,
            ),
            horizontalSpace(8),
            Text(
              message,
              style: AppTextStyles.font16WhiteRegular,
            ),
          ],
        ),
        backgroundColor: AppColors.kGreenColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }