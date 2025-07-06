import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';

class PaymentTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const PaymentTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: buildInputDecoration(),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      labelText: label,
      labelStyle: AppTextStyles.font14TextGrayRegular,
      hintText: hint,
      hintStyle: AppTextStyles.font14TextGrayRegular,
      border: buildBorder(AppColors.kGrayColor),
      enabledBorder: buildBorder(AppColors.kGrayColor),
      focusedBorder: buildBorder(AppColors.kPrimaryColor),
      errorBorder: buildBorder(AppColors.kDangerColor),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ),
      filled: true,
      fillColor: AppColors.kCardWhite,
    );
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: color),
    );
  }
}
