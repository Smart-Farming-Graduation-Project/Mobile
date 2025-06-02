import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 50,
          child: const Center(
              child: CircularProgressIndicator(
            color: AppColors.kWhiteColor,
            strokeWidth: 3.5,
          ))),
    );
  }
}
