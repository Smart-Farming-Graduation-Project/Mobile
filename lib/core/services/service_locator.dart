import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/featurs/reviews/presentation/manger/helper/review_service.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<RegisterCubit>(RegisterCubit());

    getIt.registerLazySingleton<ApiService>(() => ApiService());


}
