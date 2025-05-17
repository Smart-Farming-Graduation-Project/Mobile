import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bot_bloc.dart';
import '../bloc/chat_bot_state.dart';
import '../widgets/chat_message_widget.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chat Bot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<ChatBotCubit>().clearChat();
            },
          ),
        ],
      ),
      body: BlocBuilder<ChatBotCubit, ChatBotState>(
        builder: (context, state) {
          if (state.status == ChatBotStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == ChatBotStatus.error) {
            return Center(
                child: Text(state.errorMessage ?? 'An error occurred'));
          }

          if (state.status == ChatBotStatus.loaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message =
                          state.messages[state.messages.length - 1 - index];
                      return ChatMessageWidget(message: message);
                    },
                  ),
                ),
                _MessageInput(),
              ],
            );
          }

          return const Center(child: Text('Start a conversation!'));
        },
      ),
    );
  }
}

class _MessageInput extends StatefulWidget {
  @override
  State<_MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<_MessageInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                context.read<ChatBotCubit>().sendMessage(_controller.text);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
