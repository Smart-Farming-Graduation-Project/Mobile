import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  final Function(String) onSendMessage;
  const MessageTextField({super.key, required this.onSendMessage});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final TextEditingController controller = TextEditingController();

    void sendMessage() {
    if (controller.text.trim().isNotEmpty) {
      widget.onSendMessage(controller.text.trim());
      controller.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.kWhiteColor,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: const TextStyle(color: AppColors.kGrayColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: AppColors.kGrayColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: AppColors.kPrimaryColor),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (_) => sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: sendMessage,
            backgroundColor: AppColors.kPrimaryColor,
            mini: true,
            child: const Icon(
              Icons.send,
              color: AppColors.kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}