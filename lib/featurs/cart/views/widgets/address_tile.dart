import 'package:crop_guard/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(128),
            offset: const Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          'Add an Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}