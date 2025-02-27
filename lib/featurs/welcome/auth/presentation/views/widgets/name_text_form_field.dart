import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({super.key, required this.controller,this.isUsername=false});
  final TextEditingController controller;
  final bool isUsername ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (isUsername) {
            if (RegExp(
                    r"^[a-zA-Z0-9]{3,16}$")
                .hasMatch(value!)) {
              return null;
            } else {
              return "Enter a valid name like User123";
            }
          }else{
            if (RegExp(
                    r"^[A-Za-z]{2,30}$")
                .hasMatch(value!)) {
              return null;
            } else {
              return "Enter a valid Name";
            }
          }         
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person,
            color: AppColors.kPrimaryColor,
          ),
          labelText: isUsername ? 'Username' : 'Name',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.kPrimaryColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
