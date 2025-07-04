import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/features/farmer/update_products/domain/entities/product_image_entity.dart';

class UnifiedImageSectionWidget extends StatefulWidget {
  final List<ProductImageEntity> images;
  final VoidCallback onPickImage;
  final Function(int) onRemoveImage;
  final bool isImageLoading;

  const UnifiedImageSectionWidget({
    super.key,
    required this.images,
    required this.onPickImage,
    required this.onRemoveImage,
    this.isImageLoading = false,
  });

  @override
  State<UnifiedImageSectionWidget> createState() =>
      _UnifiedImageSectionWidgetState();
}

class _UnifiedImageSectionWidgetState extends State<UnifiedImageSectionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(UnifiedImageSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

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

        // Images Grid
        if (widget.images.isNotEmpty) ...[
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              final image = widget.images[index];
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
                        child: image.isNetworkImage
                            ? Image.network(
                                image.displayImage,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: AppColors.kGrayColor
                                        .withValues(alpha: 0.3),
                                    child: const Icon(
                                      Icons.broken_image,
                                      color: AppColors.kGrayColor,
                                    ),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    color: AppColors.kGrayColor
                                        .withValues(alpha: 0.3),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                        color: AppColors.kGreenColor,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Image.file(
                                File(image.displayImage),
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
        if (widget.images.length < 5)
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
        if (widget.images.isNotEmpty) ...[
          verticalSpace(8),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1.0,
            child: Text(
              '${widget.images.length} of 5 images selected',
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
