
import 'package:crop_guard/core/responsive/widget_height.dart';
import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class NextButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onPressed;

  const NextButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widgetWidth(context: context, width: isLastPage?5:20 ),
        vertical: widgetHeight(context: context, height: 20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            widgetWidth(context: context, width: 150),
            widgetHeight(context: context, height: 50),
          ),
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widgetHeight(context: context, height: 10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          isLastPage ? "Get Started" : "Next",
          style: AppTextStyles.textStyle24.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
