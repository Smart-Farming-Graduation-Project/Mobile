import 'package:crop_guard/core/helper/spacing.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/cubits/pest_detection_cubit/pest_detection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          context.read<PestDetectionCubit>().getImage();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.kPrimaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.camera_alt_rounded,
                size: 24.sp,
                color: AppColors.kWhiteColor,
              ),
              horizontalSpace(10),
              Text(
                'Select Image',
                style: AppTextStyles.font20WhiteBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
