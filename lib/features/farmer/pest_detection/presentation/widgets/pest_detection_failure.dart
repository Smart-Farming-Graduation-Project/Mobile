import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/widgets/pest_detection_button.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/widgets/selected_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PestDetectionFailure extends StatelessWidget {
  const PestDetectionFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SelectedImage(),
          verticalSpace(30),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Error: ',
                  style: AppTextStyles.font20BlackSemiBold,
                ),
                TextSpan(
                  text: 'Could\'t detect pest',
                  style: AppTextStyles.font18BlackRegular,
                ),
              ],
            ),
          ),
          Text(
            'Please try again',
            style: AppTextStyles.font18BlackRegular,
          ),
          verticalSpace(20),
          PestDetectionButton(
            text: 'Try Another Image',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
