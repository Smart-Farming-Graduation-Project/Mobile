import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsernameTextFormField extends StatelessWidget {
  const UsernameTextFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (RegExp(r"^[a-zA-Z0-9]{3,16}$").hasMatch(value!)) {
          return null;
        } else {
          return 'Enter a valid username like User123';
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: AppColors.kPrimaryColor,
        ),
        labelText: 'Username',
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
