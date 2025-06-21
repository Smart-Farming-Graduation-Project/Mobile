import 'package:crop_guard/features/farmer/chat_bot/domain/entities/chat_message.dart';

class SendMessageState {}
class ChatBotInitial extends SendMessageState {
  final String message = 'Hello, how can I help you today?';
}

class SendMessageSuccess extends SendMessageState {
  final ChatMessage message;
  SendMessageSuccess({required this.message});
}

class ChatBotResponseLoaded extends SendMessageState {
  final ChatMessage response;

  ChatBotResponseLoaded({required this.response});
}

class ChatBotResponseError extends SendMessageState {
  final String error;

  ChatBotResponseError({required this.error});
}
