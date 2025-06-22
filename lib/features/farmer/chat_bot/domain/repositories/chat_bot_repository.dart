import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/chat_message.dart';

abstract class ChatBotRepository {
  Future<Either<FailureModel, ChatMessage>> sendMessage(String message);
  Stream<Either<FailureModel, List<ChatMessage>>> getChatHistory();
  Future<Either<FailureModel, void>> clearChatHistory();
}
