import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_interceptor.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = 'https://crop-pilot-api.azurewebsites.net/api/';
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) async {
    try {
      final response =
          await dio.delete(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) async {
    try {
      final response =
          await dio.post(path, queryParameters: queryParameters, data: data);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) async {
    try {
      final response =
          await dio.put(path, queryParameters: queryParameters, data: data);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
