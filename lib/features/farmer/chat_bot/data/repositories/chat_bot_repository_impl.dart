import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_bot_repository.dart';
import '../datasources/chat_bot_remote_data_source.dart';

class ChatBotRepositoryImpl implements ChatBotRepository {
  final ChatBotRemoteDataSource remoteDataSource;

  ChatBotRepositoryImpl(this.remoteDataSource);

  @override
  Future<ChatMessage> sendMessage(String message) async {
    return await remoteDataSource.sendMessage(message);
  }

  @override
  Stream<List<ChatMessage>> getChatHistory() {
    return remoteDataSource.getChatHistory();
  }

  @override
  Future<void> clearChatHistory() async {
    await remoteDataSource.clearChatHistory();
  }
}
