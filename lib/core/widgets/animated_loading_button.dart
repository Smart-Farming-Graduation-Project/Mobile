import 'package:flutter/material.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLoadingButton extends StatefulWidget {
  const AnimatedLoadingButton({super.key});

  @override
  State<AnimatedLoadingButton> createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton> {
  double width = 450.h; // Start with full width

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        width = 90; // Change width to 90 after 500 milliseconds
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        width: width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.kWhiteColor,
            strokeWidth: 3.5,
          ),
        ),
      ),
    );
  }
}
