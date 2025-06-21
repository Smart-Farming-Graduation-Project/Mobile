import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/farmer/chat_bot/data/repositories/chat_bot_repository_impl.dart';
import 'package:crop_guard/features/farmer/chat_bot/domain/usecases/send_message_usecase.dart';
import 'package:crop_guard/features/farmer/chat_bot/presentation/manger/send_message_cubit/send_message_cubit.dart';
import 'package:crop_guard/features/farmer/chat_bot/presentation/manger/send_message_cubit/send_message_state.dart';
import 'package:crop_guard/features/farmer/chat_bot/presentation/views/widgets/message_bubble.dart';
import 'package:crop_guard/features/farmer/chat_bot/presentation/views/widgets/message_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SendMessageCubit(SendMessageUseCase(getIt<ChatBotRepositoryImpl>())),
      child: const _ChatBotContent(),
    );
  }
}

class _ChatBotContent extends StatefulWidget {
  const _ChatBotContent();

  @override
  State<_ChatBotContent> createState() => _ChatBotContentState();
}

class _ChatBotContentState extends State<_ChatBotContent> {
  final List<Map<String, dynamic>> messages = [
    {
      'message': 'Hello, how can I help you today?',
      'isUser': false,
    },
  ];
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Chat Bot"),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<SendMessageCubit, SendMessageState>(
              listener: (context, state) {
                if (state is ChatBotResponseLoaded) {
                  setState(() {
                    // إضافة رد البوت
                    messages.add({
                      'message': state.response.content,
                      'isUser': false,
                    });
                  });
                  // التمرير لأسفل بعد إضافة الرد
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollToBottom();
                  });
                } else if (state is ChatBotResponseError) {
                  // عرض رسالة خطأ
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${state.error}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return MessageBubble(
                      message: message['message'],
                      isUser: message['isUser'],
                    );
                  },
                  itemCount: messages.length,
                );
              },
            ),
          ),
          // عرض loading indicator أثناء إرسال الرسالة
          BlocBuilder<SendMessageCubit, SendMessageState>(
            builder: (context, state) {
              if (state is SendMessageSuccess) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 10),
                      Text('Bot is typing...'),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MessageTextField(onSendMessage: (String message) {
            if (message.trim().isNotEmpty) {
              setState(() {
                // إضافة رسالة اليوزر
                messages.add({
                  'message': message,
                  'isUser': true,
                });
              });

              // التمرير لأسفل بعد إضافة رسالة اليوزر
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollToBottom();
              });

              // إرسال الرسالة للبوت
              context.read<SendMessageCubit>().sendMessage(message);
            }
          }),
        ],
      ),
    );
  }
}
