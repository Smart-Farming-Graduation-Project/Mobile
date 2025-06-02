import '../../domain/entities/chat_message.dart';

enum ChatBotStatus { initial, loading, loaded, error }

class ChatBotState {
  final ChatBotStatus status;
  final List<ChatMessage> messages;
  final String? errorMessage;

  const ChatBotState({
    this.status = ChatBotStatus.initial,
    this.messages = const [],
    this.errorMessage,
  });

  ChatBotState copyWith({
    ChatBotStatus? status,
    List<ChatMessage>? messages,
    String? errorMessage,
  }) {
    return ChatBotState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
