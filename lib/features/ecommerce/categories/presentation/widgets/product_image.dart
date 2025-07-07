import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.error,
                color: AppColors.kDangerColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
