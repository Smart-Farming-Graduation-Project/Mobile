import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle font12WhiteRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.kWhiteColor,
  );

  static TextStyle font12BlackBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.kGrayColor,
  );

  static TextStyle font14BlackBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle font16GreenBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle font16BlackBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle font16GreyBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kGrayColor,
  );

  static TextStyle font16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static const TextStyle font18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle font20WhiteBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.kWhiteColor,
  );

  static const TextStyle font22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle font24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle font32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle font40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeightHelper.regular,
  );
}
