import '../models/chat_message_model.dart';

abstract class ChatBotRemoteDataSource {
  Future<ChatMessageModel> sendMessage(String message);
  Stream<List<ChatMessageModel>> getChatHistory();
  Future<void> clearChatHistory();
}

class ChatBotRemoteDataSourceImpl implements ChatBotRemoteDataSource {
  // TODO: Implement actual API calls here
  @override
  Future<ChatMessageModel> sendMessage(String message) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: 'This is a simulated response to: $message',
      isUser: false,
      timestamp: DateTime.now(),
    );
  }

  @override
  Stream<List<ChatMessageModel>> getChatHistory() async* {
    // Simulate chat history
    yield [];
  }

  @override
  Future<void> clearChatHistory() async {
    // Simulate clearing chat history
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
