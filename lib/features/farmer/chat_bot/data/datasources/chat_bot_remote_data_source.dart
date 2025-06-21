import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/end_points.dart';

import '../models/chat_message_model.dart';

abstract class ChatBotRemoteDataSource {
  Future<ChatMessageModel> sendMessage(String message);
  Stream<List<ChatMessageModel>> getChatHistory();
  Future<void> clearChatHistory();
}

class ChatBotRemoteDataSourceImpl implements ChatBotRemoteDataSource {
  final ApiConsumer api;
  ChatBotRemoteDataSourceImpl({required this.api});

  @override
  Future<ChatMessageModel> sendMessage(String message) async {
    final response = await api.post(
      EndPoints.chat,
      data: {ApiKeys.prompt: message},
    );
    return ChatMessageModel.fromJson(response);
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
