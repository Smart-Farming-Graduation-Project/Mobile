import 'package:crop_guard/core/responsive/widget_height.dart';
import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.kPrimaryColor.withAlpha(200),
            ),
            width: widgetWidth(context: context, width: 90),
            height: widgetHeight(context: context, height: 30),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            )));
  }
}
