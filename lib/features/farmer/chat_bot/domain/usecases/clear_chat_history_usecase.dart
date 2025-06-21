import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/no_param_use_case.dart';
import 'package:crop_guard/features/farmer/chat_bot/domain/repositories/chat_bot_repository.dart';
import 'package:dartz/dartz.dart';

class ClearChatHistoryUsecase implements UseCase<void> {
  final ChatBotRepository repository;

  ClearChatHistoryUsecase(this.repository);

  @override
  Future<Either<FailureModel, void>> call() {
    return repository.clearChatHistory();
  }
}
