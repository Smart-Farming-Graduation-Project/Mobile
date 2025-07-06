import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/responsive/widget_height.dart';
import '../../../../../core/responsive/widget_width.dart';

class DirectionButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback onReleased;

  const DirectionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.onReleased,
  });

  @override
  DirectionButtonState createState() => DirectionButtonState();
}

class DirectionButtonState extends State<DirectionButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
        widget.onPressed();
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onReleased();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
        widget.onReleased();
      },
      child: Container(
        width: widgetWidth(context: context, width: 80),
        height: widgetHeight(context: context, height: 80),
        decoration: BoxDecoration(
          color: isPressed ? AppColors.kPrimaryColor : AppColors.kCardWhite,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.kShadowColor,
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
              spreadRadius: 0,
            ),
          ],
          border: Border.all(
            color: isPressed
                ? AppColors.kPrimaryColor
                : AppColors.kGrayColor.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        child: Center(
          child: Icon(
            widget.icon,
            color: isPressed ? AppColors.kWhiteColor : AppColors.kPrimaryColor,
            size: 40.w,
          ),
        ),
      ),
    );
  }
}
