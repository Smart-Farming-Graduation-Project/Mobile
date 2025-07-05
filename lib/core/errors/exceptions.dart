import 'dart:developer';

import 'package:crop_guard/core/errors/error_model.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});
}

class MultiBaseApiException implements Exception {
  final FailureModel failureModel;

  MultiBaseApiException({required this.failureModel});
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
        case 401: 
        //Unauthorized
          log(e.response!.data.toString());
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
              errorModel: ErrorModel.fromJson({
            "errorMessage": "server error please try again later",
            "statusCode": 500,
            "succeeded": false,
            "data": {
              "message": "server error please try again later",
            },
            "meta": null
          }));
        default: //Something went wrong
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}

void handleMultiBaseDioExceptions(DioException e) {
  String message = 'An unknown error occurred';
  if (e.response != null && e.response?.data != null) {
    if (e.response?.data is Map && e.response?.data['message'] != null) {
      message = e.response?.data['message']?.toString() ??
          'An unknown error occurred';
    } else if (e.response?.data is String) {
      message = e.response?.data.toString() ?? 'An unknown error occurred';
    }
  }
  message = e.message?.toString() ?? message;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      message = 'Please check your internet connection';
      break;
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
    case DioExceptionType.badResponse:
      // message already set above if possible
      break;
  }
  message = message.isNotEmpty ? message : 'An unknown error occurred';
  throw MultiBaseApiException(failureModel: FailureModel(message: message));
}
