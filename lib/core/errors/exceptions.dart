import 'dart:developer';

import 'package:crop_guard/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      if (e.response != null) {
        log(e.response!.data.toString());
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      } else {
        throw NetworkException(
            message: 'please check your internet connection');
      }

    case DioExceptionType.sendTimeout:
      if (e.response != null) {
        log(e.response!.data.toString());
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      } else {
        throw NetworkException(
            message: 'please check your internet connection');
      }

    case DioExceptionType.receiveTimeout:
      if (e.response != null) {
        log(e.response!.data.toString());
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      } else {
        throw NetworkException(
            message: 'please check your internet connection');
      }

    case DioExceptionType.badCertificate:
      log(e.response!.data.toString());

      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      log(e.response!.data.toString());

      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      log(e.response!.data.toString());

      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      log(e.response!.data.toString());

      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad request
          log(e.response!.data.toString());

          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401: //Unauthorized
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 403: //Forbidden
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 404: //Not found
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 409: //Conflict
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 422: //Unprocessable entity
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 500: //Internal server error
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        default: //Something went wrong
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
