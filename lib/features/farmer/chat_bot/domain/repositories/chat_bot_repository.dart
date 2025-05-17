import '../entities/chat_message.dart';

abstract class ChatBotRepository {
  Future<ChatMessage> sendMessage(String message);
  Stream<List<ChatMessage>> getChatHistory();
  Future<void> clearChatHistory();
}
