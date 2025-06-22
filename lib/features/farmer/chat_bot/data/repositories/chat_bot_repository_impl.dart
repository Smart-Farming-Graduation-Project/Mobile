import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_bot_repository.dart';
import '../datasources/chat_bot_remote_data_source.dart';

class ChatBotRepositoryImpl implements ChatBotRepository {
  final ChatBotRemoteDataSource remoteDataSource;

  ChatBotRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<FailureModel, ChatMessage>> sendMessage(String message) async {
    try {
      final response = await remoteDataSource.sendMessage(message);
      return Right(response);
    } on ServerException catch (e) {
      return Left(FailureModel(message: e.errorModel.errorMessage));
    } on NetworkException catch (e) {
      return Left(FailureModel(message: e.message));
    }
  }

  @override
  Stream<Either<FailureModel, List<ChatMessage>>> getChatHistory() {
    return remoteDataSource.getChatHistory().map((response) {
      return Right([
        ChatMessage(
          content: 'Hello',
          isUser: true,
          timestamp: DateTime.now(),
        ),
      ]);
    });
  }

  @override
  Future<Either<FailureModel, void>> clearChatHistory() async {
    try {
      await remoteDataSource.clearChatHistory();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(FailureModel(message: e.errorModel.errorMessage));
    } on NetworkException catch (e) {
      return Left(FailureModel(message: e.message));
    }
  }
}
