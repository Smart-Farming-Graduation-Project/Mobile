import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/parm_use_case.dart';
import 'package:crop_guard/features/farmer/chat_bot/domain/entities/chat_message.dart';
import 'package:dartz/dartz.dart';

import '../repositories/chat_bot_repository.dart';

class SendMessageUseCase implements UseCase<ChatMessage, String> {
  final ChatBotRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<Either<FailureModel, ChatMessage>> call(String message) async {
    return await repository.sendMessage(message);
  }
}
