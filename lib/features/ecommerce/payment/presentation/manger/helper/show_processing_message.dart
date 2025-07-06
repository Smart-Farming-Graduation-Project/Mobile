import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

void showProcessingMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.kWhiteColor),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Processing Payment...',
              style: AppTextStyles.font16WhiteRegular,
            ),
          ],
        ),
        backgroundColor: AppColors.kPrimaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }