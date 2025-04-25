import 'package:crop_guard/core/api/end_points.dart';

class ErrorModel {
  final dynamic errorMessage;
  final int statusCode;
  final bool succeeded;
  final Map<String, dynamic>? data;
  final dynamic meta;

  ErrorModel(
      {required this.errorMessage,
      required this.statusCode,
      required this.succeeded,
      required this.data,
      required this.meta});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
        errorMessage: json[ApiKeys.errorMessage],
        statusCode: json[ApiKeys.statusCode],
        succeeded: json[ApiKeys.succeeded],
        data: json[ApiKeys.data],
        meta: json[ApiKeys.meta]);
  }
}
