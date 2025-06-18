import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    required this.isUser,
  });
  final bool isUser;
  final String message;


  @override
  Widget build(BuildContext context) {
    
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isUser ? AppColors.kPrimaryColor : AppColors.kLightBlackColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message,
          style: isUser ? AppTextStyles.font16WhiteRegular : AppTextStyles.font16BlackRegular,
        ),
      ),
    );
  }
}