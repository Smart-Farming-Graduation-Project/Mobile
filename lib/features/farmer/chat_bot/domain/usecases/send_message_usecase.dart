import '../entities/chat_message.dart';
import '../repositories/chat_bot_repository.dart';

class SendMessageUseCase {
  final ChatBotRepository repository;

  SendMessageUseCase(this.repository);

  Future<ChatMessage> call(String message) async {
    return await repository.sendMessage(message);
  }
}
