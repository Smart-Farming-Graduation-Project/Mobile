import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/decoded_token.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> refreshToken() async {
  final api = getIt<DioConsumer>();
  try {
    log(getIt<CacheHelper>().getData(key: ApiKeys.accessToken).toString());
    final response = await api.post(
      EndPoints.refreshToken,
      data: {
        ApiKeys.tokens: {
          ApiKeys.accessToken:
              getIt<CacheHelper>().getDataString(key: ApiKeys.accessToken),
          ApiKeys.refreshToken:
              getIt<CacheHelper>().getDataString(key: ApiKeys.refreshToken),
        },
      },
    );
    log(response.toString());
    getIt<CacheHelper>().saveData(
        key: ApiKeys.accessToken,
        value: response[ApiKeys.data][ApiKeys.accessToken]);
    getIt<CacheHelper>().saveData(
        key: ApiKeys.refreshToken,
        value: response[ApiKeys.data][ApiKeys.refreshToken]);
    DecodedToken()
        .saveDecodedToken(response[ApiKeys.data][ApiKeys.accessToken]);
  } on ServerException catch (e) {
    getIt<CacheHelper>().removeData(key: ApiKeys.accessToken);
    getIt<CacheHelper>().removeData(key: ApiKeys.refreshToken);
    getIt<CacheHelper>().removeData(key: ApiKeys.role);
    log(e.errorModel.errorMessage);

    GoRouter.of(getIt<GlobalKey<NavigatorState>>().currentContext!)
        .go(AppRouter.signIn);
    ScaffoldMessenger.of(getIt<GlobalKey<NavigatorState>>().currentContext!)
        .showSnackBar(
      SnackBar(
        content: Text(e.errorModel.errorMessage),
        backgroundColor: AppColors.kDangerColor,
      ),
    );
  }
}
