import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class TextBox1 extends StatefulWidget {
  const TextBox1({super.key, required this.name});
  final String name;

  @override
  State<TextBox1> createState() => _TextBox1State();
}

class _TextBox1State extends State<TextBox1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.name,
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
