import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.authorization] =
        getIt<CacheHelper>().getData(key: ApiKeys.accessToken) != null
            ? 'Bearer ${getIt<CacheHelper>().getData(key: ApiKeys.accessToken)}'
            : null;
    super.onRequest(options, handler);
  }
}
