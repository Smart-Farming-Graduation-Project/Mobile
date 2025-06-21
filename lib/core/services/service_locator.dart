import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/features/ecommerce/reviews/data/datasources/review_service.dart';
import 'package:crop_guard/features/farmer/chat_bot/data/datasources/chat_bot_remote_data_source.dart';
import 'package:crop_guard/features/farmer/chat_bot/data/repositories/chat_bot_repository_impl.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_cubit.dart';
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
  getIt.registerSingleton<ChatBotRepositoryImpl>(ChatBotRepositoryImpl(
      ChatBotRemoteDataSourceImpl(api: getIt<DioConsumer>())));
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}
