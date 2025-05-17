import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/widgets/select_image_button.dart';
import 'package:flutter/material.dart';

class InitialPestDetection extends StatelessWidget {
  const InitialPestDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SelectImageButton(),
        verticalSpace(20),
        Text(
          'No Image Selected',
          style: AppTextStyles.font20BlackSemiBold,
        ),
      ],
    );
  }
}
