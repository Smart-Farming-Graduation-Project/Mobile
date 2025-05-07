import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle textStyle12WhiteRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.kWhiteColor,
  );

  static TextStyle textStyle12BlackBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle textStyle14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.kGrayColor,
  );

  static TextStyle textStyle14BlackBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle textStyle16GreenBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle textStyle16BlackBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle textStyle16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static const TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static const TextStyle textStyle22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle textStyle40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeightHelper.regular,
  );
}
