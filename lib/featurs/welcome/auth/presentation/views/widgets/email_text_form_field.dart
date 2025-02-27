import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!)) {
            return null;
          } else {
            return "Enter a valid email";
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: AppColors.kPrimaryColor,
          ),
          labelText: "Email",
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.kPrimaryColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
