import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class TextBox1 extends StatelessWidget {
  const TextBox1({super.key, required this.name, required this.initialValue});
  final String name;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          labelText: name,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.kPrimaryColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: AppColors.kWhiteColor,
          filled: true,
        ),
      ),
    );
  }
}
