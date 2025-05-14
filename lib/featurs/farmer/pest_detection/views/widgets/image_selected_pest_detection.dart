import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/featurs/farmer/pest_detection/views/widgets/pest_detection_button.dart';
import 'package:crop_guard/featurs/farmer/pest_detection/views/widgets/selected_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSelectedPestDetection extends StatelessWidget {
  const ImageSelectedPestDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SelectedImage(),
          verticalSpace(30),
          Text(
            'Image Selected Successfully',
            style: AppTextStyles.font20BlackSemiBold,
          ),
          verticalSpace(20),
          PestDetectionButton(
            onTap: () {},
            text: 'Detect Pest',
            horizontalPadding: 30,
          ),
        ],
      ),
    );
  }
}
