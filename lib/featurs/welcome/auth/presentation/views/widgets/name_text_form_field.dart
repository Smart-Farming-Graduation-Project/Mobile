import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField(
      {super.key, required this.controller, required this.labelText});
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (RegExp(r'^[A-Za-z]{2,30}$').hasMatch(value!)) {
          return null;
        } else {
          return 'Enter a valid Name';
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: AppColors.kPrimaryColor,
        ),
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
