import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_bot_repository.dart';
import 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotRepository repository;

  ChatBotCubit(this.repository) : super(const ChatBotState()) {
    // Load chat history
    repository.getChatHistory().listen((chatHistory) {
      emit(state.copyWith(
        status: ChatBotStatus.loaded,
        messages: chatHistory,
      ));
    });
  }

  Future<void> sendMessage(String message) async {
    try {
      emit(state.copyWith(status: ChatBotStatus.loading));

      // Add user message
      final userMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: message,
        isUser: true,
        timestamp: DateTime.now(),
      );

      final updatedMessages = [...state.messages, userMessage];
      emit(state.copyWith(
        status: ChatBotStatus.loaded,
        messages: updatedMessages,
      ));

      // Get bot response
      final botResponse = await repository.sendMessage(message);
      emit(state.copyWith(
        status: ChatBotStatus.loaded,
        messages: [...updatedMessages, botResponse],
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ChatBotStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> clearChat() async {
    try {
      emit(state.copyWith(status: ChatBotStatus.loading));
      await repository.clearChatHistory();
      emit(state.copyWith(
        status: ChatBotStatus.loaded,
        messages: [],
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ChatBotStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
