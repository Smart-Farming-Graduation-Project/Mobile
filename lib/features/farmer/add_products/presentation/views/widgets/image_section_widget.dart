import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';

class ImageSectionWidget extends StatelessWidget {
  final List<File> selectedImages;
  final VoidCallback onPickImage;
  final Function(int) onRemoveImage;

  const ImageSectionWidget({
    super.key,
    required this.selectedImages,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Images',
          style: AppTextStyles.font16BlackBold,
        ),
        verticalSpace(8),
        Text(
          'Add up to 5 images',
          style: AppTextStyles.font14TextGrayRegular,
        ),
        verticalSpace(12),

        // Selected Images Grid
        if (selectedImages.isNotEmpty) ...[
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemCount: selectedImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.kGrayColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.file(
                        selectedImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () => onRemoveImage(index),
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: const BoxDecoration(
                          color: AppColors.kDangerColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 16.sp,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          verticalSpace(12),
        ],

        // Add Image Button
        if (selectedImages.length < 5)
          GestureDetector(
            onTap: onPickImage,
            child: Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.kGrayColor,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 32.sp,
                    color: AppColors.kGrayColor,
                  ),
                  verticalSpace(8),
                  Text(
                    'Add Image',
                    style: AppTextStyles.font14TextGrayRegular,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
