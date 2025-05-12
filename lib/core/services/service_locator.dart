import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/featurs/ecommerce/reviews/presentation/manger/helper/review_service.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<RegisterCubit>(RegisterCubit());
  getIt.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>());
  getIt.registerSingleton<TermsAndConditionsCubit>(TermsAndConditionsCubit());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
