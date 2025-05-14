import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/featurs/farmer/pest_detection/views/widgets/pest_detection_button.dart';
import 'package:crop_guard/featurs/farmer/pest_detection/views/widgets/pest_detection_image_result.dart';
import 'package:crop_guard/featurs/farmer/pest_detection/views/widgets/selected_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PestDetectionSuccess extends StatelessWidget {
  const PestDetectionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SelectedImage(height: 150),
                    verticalSpace(10),
                    Text(
                      'Original Image',
                      style: AppTextStyles.font18BlackRegular,
                    ),
                  ],
                ),
              ),
              horizontalSpace(10),
              Expanded(
                  child: Column(
                children: [
                  const PestDetectionImageResult(),
                  verticalSpace(10),
                  Text(
                    'Result Image',
                    style: AppTextStyles.font18BlackRegular,
                  ),
                ],
              )),
            ],
          ),
          verticalSpace(30),
          Text(
            'Detection Completed',
            style: AppTextStyles.font20BlackBold,
          ),
          verticalSpace(10),
          Text(
            'Pest Type: Locust',
            style: AppTextStyles.font18BlackRegular,
          ),
          verticalSpace(30),
          PestDetectionButton(
            text: 'Try Another Image',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
