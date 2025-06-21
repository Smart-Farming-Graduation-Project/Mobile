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
    emit(SendMessageSuccess(message: chatMessage));
    final response = await sendMessageUseCase.call(message);
    response.fold(
      (l) => emit(ChatBotResponseError(error: l.message)),
      (r) => emit(ChatBotResponseLoaded(response: r)),
    );
  }
}
