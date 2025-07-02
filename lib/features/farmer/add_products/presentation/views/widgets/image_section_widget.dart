import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';

class ImageSectionWidget extends StatefulWidget {
  final List<File> selectedImages;
  final List<String>? existingImages;
  final VoidCallback onPickImage;
  final Function(int) onRemoveImage;
  final Function(int)? onRemoveExistingImage;
  final bool isImageLoading;
  final String? imageSelectionMessage;
  final bool showImageSuccessMessage;

  const ImageSectionWidget({
    super.key,
    required this.selectedImages,
    this.existingImages,
    required this.onPickImage,
    required this.onRemoveImage,
    this.onRemoveExistingImage,
    this.isImageLoading = false,
    this.imageSelectionMessage,
    this.showImageSuccessMessage = false,
  });

  @override
  State<ImageSectionWidget> createState() => _ImageSectionWidgetState();
}

class _ImageSectionWidgetState extends State<ImageSectionWidget> {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print(
          '🖼️ ImageSectionWidget: Initialized with ${widget.selectedImages.length} selected images');
    }
  }

  @override
  void didUpdateWidget(ImageSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kDebugMode) {
      if (oldWidget.selectedImages.length != widget.selectedImages.length) {
        print(
            '🔄 ImageSectionWidget: Image count changed from ${oldWidget.selectedImages.length} to ${widget.selectedImages.length}');
      }
      if (oldWidget.isImageLoading != widget.isImageLoading) {
        print(
            '🔄 ImageSectionWidget: Loading state changed to ${widget.isImageLoading}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalImages =
        (widget.existingImages?.length ?? 0) + widget.selectedImages.length;

    if (kDebugMode) {
      print('🎨 ImageSectionWidget: Building with $totalImages total images');
    }

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

        // Image Selection Message
        if (widget.imageSelectionMessage != null) ...[
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: widget.showImageSuccessMessage
                  ? AppColors.kGreenColor.withValues(alpha: 0.1)
                  : AppColors.kDangerColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: widget.showImageSuccessMessage
                    ? AppColors.kGreenColor
                    : AppColors.kDangerColor,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  widget.showImageSuccessMessage
                      ? Icons.check_circle
                      : Icons.error,
                  color: widget.showImageSuccessMessage
                      ? AppColors.kGreenColor
                      : AppColors.kDangerColor,
                  size: 16.sp,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                    widget.imageSelectionMessage!,
                    style: AppTextStyles.font14BlackRegular.copyWith(
                      color: widget.showImageSuccessMessage
                          ? AppColors.kGreenColor
                          : AppColors.kDangerColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(12),
        ],

        // Existing Images Grid
        if (widget.existingImages != null &&
            widget.existingImages!.isNotEmpty) ...[
          Text(
            'Existing Images',
            style: AppTextStyles.font14BlackSemiBold,
          ),
          verticalSpace(8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemCount: widget.existingImages!.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.kGrayColor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          widget.existingImages![index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color:
                                  AppColors.kGrayColor.withValues(alpha: 0.3),
                              child: const Icon(
                                Icons.broken_image,
                                color: AppColors.kGrayColor,
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color:
                                  AppColors.kGrayColor.withValues(alpha: 0.3),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                  color: AppColors.kGreenColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (widget.onRemoveExistingImage != null)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => widget.onRemoveExistingImage!(index),
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
                ),
              );
            },
          ),
          verticalSpace(12),
        ],

        // New Selected Images Grid
        if (widget.selectedImages.isNotEmpty) ...[
          if (widget.existingImages != null &&
              widget.existingImages!.isNotEmpty)
            Text(
              'New Images',
              style: AppTextStyles.font14BlackSemiBold,
            ),
          if (widget.existingImages != null &&
              widget.existingImages!.isNotEmpty)
            verticalSpace(8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemCount: widget.selectedImages.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.kGrayColor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.file(
                          widget.selectedImages[index],
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
                        onTap: () => widget.onRemoveImage(index),
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
                ),
              );
            },
          ),
          verticalSpace(12),
        ],

        // Add Image Button
        if (totalImages < 5)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: widget.isImageLoading ? null : widget.onPickImage,
              child: Container(
                width: double.infinity,
                height: 120.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.isImageLoading
                        ? AppColors.kGrayColor.withValues(alpha: 0.5)
                        : AppColors.kGrayColor,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  color: widget.isImageLoading
                      ? AppColors.kGrayColor.withValues(alpha: 0.1)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.isImageLoading)
                      SizedBox(
                        width: 24.sp,
                        height: 24.sp,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.kGreenColor,
                        ),
                      )
                    else
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 32.sp,
                        color: AppColors.kGrayColor,
                      ),
                    verticalSpace(8),
                    Text(
                      widget.isImageLoading ? 'Loading...' : 'Add Image',
                      style: AppTextStyles.font14TextGrayRegular.copyWith(
                        color: widget.isImageLoading
                            ? AppColors.kGrayColor.withValues(alpha: 0.5)
                            : AppColors.kGrayColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // Image count indicator
        if (totalImages > 0) ...[
          verticalSpace(8),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1.0,
            child: Text(
              '$totalImages of 5 images selected',
              style: AppTextStyles.font12BlackBold.copyWith(
                color: AppColors.kGrayColor,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
