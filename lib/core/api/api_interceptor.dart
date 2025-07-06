import 'dart:async';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/helper/refresh_token.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  //to prevent multiple requests while refreshing token
  bool isRefreshing = false;
  //to make reminder request wait for the token to be refreshed
  Completer<void>? refreshCompleter;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.authorization] =
        getIt<CacheHelper>().getData(key: ApiKeys.accessToken) != null
            ? 'Bearer ${getIt<CacheHelper>().getData(key: ApiKeys.accessToken)}'
            : null;
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    if (err.response?.statusCode == 401 &&
        getIt<CacheHelper>().getData(key: ApiKeys.accessToken) != null) {
      //to call the same request again after token is refreshed
      // final requestOptions = err.requestOptions;
      if (!isRefreshing) {
        isRefreshing = true;
        refreshCompleter = Completer<void>();
        try {
          await refreshToken();
          refreshCompleter?.complete();
        } catch (e) {
          refreshCompleter?.completeError(e);
        } finally {
          isRefreshing = false;
        }
      } else {
        await refreshCompleter?.future;
      }

      // بعد ما نحدث التوكن بنجاح، نعيد إرسال نفس الطلب
      try {
        final newToken = getIt<CacheHelper>().getData(key: ApiKeys.accessToken);
        options.headers[ApiKeys.authorization] = 'Bearer $newToken';

        final response = await getIt<DioConsumer>().dio.fetch(options);
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }

    return super.onError(err, handler);
  }
}
