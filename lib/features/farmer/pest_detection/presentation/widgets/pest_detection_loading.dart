import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/widgets/loading_indicator.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/widgets/selected_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PestDetectionLoading extends StatelessWidget {
  const PestDetectionLoading({super.key});

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
            'Detecting Pest...',
            style: AppTextStyles.font20BlackSemiBold,
          ),
          verticalSpace(10),
          Text(
            'Please wait...',
            style: AppTextStyles.font18BlackRegular,
          ),
          verticalSpace(40),
          const LoadingIndicator(),
        ],
      ),
    );
  }
}
