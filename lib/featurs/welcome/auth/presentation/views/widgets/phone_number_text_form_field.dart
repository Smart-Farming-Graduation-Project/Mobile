import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PhoneNumberTextFormField extends StatelessWidget {
  const PhoneNumberTextFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (RegExp(r'^[0-9]{10,15}$').hasMatch(value!)) {
          return null;
        } else {
          return 'Enter a valid phone number';
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone,
          color: AppColors.kPrimaryColor,
        ),
        labelText: 'Phone Number',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
