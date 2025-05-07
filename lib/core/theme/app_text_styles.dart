import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle textStyle12WhiteRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kWhiteColor,
  );

  static TextStyle textStyle12BlackBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle textStyle14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kGrayColor,
  );

  static TextStyle textStyle14BlackBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle textStyle16GreenBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle textStyle16BlackBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlackColor,
  );

  static TextStyle textStyle16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlackColor,
  );

  static const TextStyle textStyle22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
  );
}
