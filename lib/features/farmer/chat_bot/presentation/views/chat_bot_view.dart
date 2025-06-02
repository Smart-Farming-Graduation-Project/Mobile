import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chat Bot'),
      ),
      body: const Center(
        child: Text('Chat Bot View'),
      ),
    );
  }
}
