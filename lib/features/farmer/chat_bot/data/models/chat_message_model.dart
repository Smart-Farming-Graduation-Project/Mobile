import 'package:crop_guard/features/farmer/chat_bot/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage  {
  int? statusCode;
  bool? succeeded;
  String? message;
  String? data;
  dynamic meta;

  ChatMessageModel({
    this.statusCode,
    this.succeeded,
    this.message,
    this.data,
    this.meta,
  }) : super(
          content: data ?? '',
          isUser: false,
          timestamp: DateTime.now(),
        );

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      statusCode: json['statusCode'] as int?,
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as String?,
      meta: json['meta'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'succeeded': succeeded,
        'message': message,
        'data': data,
        'meta': meta,
      };
}
