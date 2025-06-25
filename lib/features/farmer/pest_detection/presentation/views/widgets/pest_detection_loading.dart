import 'dart:io';

import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/widgets/loading_indicator.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/selected_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PestDetectionLoadingView extends StatelessWidget {
  const PestDetectionLoadingView({super.key, required this.image});
  final File image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectedImage(image: image),
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
