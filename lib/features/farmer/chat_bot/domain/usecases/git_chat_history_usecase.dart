import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/features/farmer/chat_bot/domain/entities/chat_message.dart';
import 'package:crop_guard/features/farmer/chat_bot/domain/repositories/chat_bot_repository.dart';
import 'package:dartz/dartz.dart';

class GitChatHistoryUsecase {
  final ChatBotRepository repository;

  GitChatHistoryUsecase(this.repository);

  Stream<Either<FailureModel, List<ChatMessage>>> call() {
    return repository.getChatHistory();
  }
}
