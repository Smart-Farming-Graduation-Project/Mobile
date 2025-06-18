import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/features/farmer/chat_bot/presentation/views/widgets/message_bubble.dart';
import 'package:crop_guard/features/farmer/chat_bot/presentation/views/widgets/message_text_field.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Chat Bot"),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const MessageBubble(message: 'Hello', isUser: true),
                const MessageBubble(message: 'Hello', isUser: false),
                const MessageBubble(message: 'Hello', isUser: true),
              ],
            ),
          ),
          const MessageTextField(),
        ],
      ),
    );
  }
}
