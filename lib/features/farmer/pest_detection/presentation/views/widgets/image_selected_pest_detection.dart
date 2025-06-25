import 'dart:io';

import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/cubits/pest_detection_cubit/pest_detection_cubit.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/pest_detection_button.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/selected_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSelectedPestDetection extends StatelessWidget {
  const ImageSelectedPestDetection({super.key, required this.image});
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
            'Image Selected Successfully',
            style: AppTextStyles.font20BlackSemiBold,
          ),
          verticalSpace(20),
          PestDetectionButton(
            onTap: () {
              context.read<PestDetectionCubit>().getPestDetectionImage(image);
            },
            text: 'Detect Pest',
            horizontalPadding: 30,
          ),
        ],
      ),
    );
  }
}
