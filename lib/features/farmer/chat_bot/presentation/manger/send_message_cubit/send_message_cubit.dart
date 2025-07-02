import 'package:crop_guard/features/farmer/chat_bot/domain/usecases/send_message_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/chat_message.dart';
import 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final SendMessageUseCase sendMessageUseCase;

  SendMessageCubit(this.sendMessageUseCase) : super(ChatBotInitial());

  Future<void> sendMessage(String message) async {
    final chatMessage = ChatMessage(
      content: message,
      isUser: true,
      timestamp: DateTime.now(),
    );

    // Check if cubit is still active before emitting
    if (!isClosed) {
      emit(SendMessageSuccess(message: chatMessage));
    }

    try {
      final response = await sendMessageUseCase.call(message);

      // Check if cubit is still active before emitting result
      if (!isClosed) {
        response.fold(
          (l) => emit(ChatBotResponseError(error: l.message)),
          (r) => emit(ChatBotResponseLoaded(response: r)),
        );
      }
    } catch (e) {
      // Check if cubit is still active before emitting error
      if (!isClosed) {
        emit(ChatBotResponseError(error: e.toString()));
      }
    }
  }
}
