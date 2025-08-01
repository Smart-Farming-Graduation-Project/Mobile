import 'dart:io';

import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({super.key, this.height, required this.image});
  final double? height;
  final File image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height?.h ?? 200.h,
      decoration: BoxDecoration(
        color: AppColors.kLightBlackColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      // this image to test the ui of the selected image and Image.assets will be replaced with Image.file
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Image.file(
          File(image.path),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
