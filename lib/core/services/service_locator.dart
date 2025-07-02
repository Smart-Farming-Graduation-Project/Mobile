import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/features/farmer/my_products/data/datasources/my_products_remote_data_source.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/cubits/review_cubit.dart';
import 'package:crop_guard/features/farmer/add_products/data/datasources/product_remote_data_source.dart';
import 'package:crop_guard/features/farmer/add_products/data/repositories/product_repository_impl.dart';
import 'package:crop_guard/features/farmer/add_products/domain/repositories/product_repository.dart';
import 'package:crop_guard/features/farmer/add_products/domain/usecases/add_product.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/cubits/add_product_cubit.dart';
import 'package:crop_guard/features/farmer/chat_bot/data/datasources/chat_bot_remote_data_source.dart';
import 'package:crop_guard/features/farmer/chat_bot/data/repositories/chat_bot_repository_impl.dart';
import 'package:crop_guard/features/farmer/my_products/data/repositories/my_products_repository_impl.dart';
import 'package:crop_guard/features/farmer/my_products/domain/repositories/my_products_repository.dart';
import 'package:crop_guard/features/farmer/my_products/domain/usecases/delete_my_product.dart';
import 'package:crop_guard/features/farmer/my_products/domain/usecases/get_my_products.dart';
import 'package:crop_guard/features/farmer/my_products/presentation/cubits/my_products_cubit.dart';
import 'package:crop_guard/features/farmer/pest_detection/data/datasources/pest_detection_remote_data_source.dart';
import 'package:crop_guard/features/farmer/pest_detection/data/repositories/pest_detection_repo_impl.dart';
import 'package:crop_guard/features/farmer/soil_info/data/datasources/soil_info_remote_datasource.dart';
import 'package:crop_guard/features/farmer/soil_info/data/repositories/sensor_info_repo_impl.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/cubits/update_product_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:crop_guard/features/farmer/update_products/data/datasources/update_product_remote_data_source.dart';
import 'package:crop_guard/features/farmer/update_products/data/repositories/update_product_repository_impl.dart';
import 'package:crop_guard/features/farmer/update_products/domain/repositories/update_product_repository.dart';
import 'package:crop_guard/features/farmer/update_products/domain/usecases/update_product.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<RegisterCubit>(RegisterCubit());
  getIt.registerSingleton<ReviewCubit>(ReviewCubit());
  getIt.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>());
  getIt.registerSingleton<TermsAndConditionsCubit>(TermsAndConditionsCubit());
  getIt.registerSingleton<ChatBotRepositoryImpl>(ChatBotRepositoryImpl(
      ChatBotRemoteDataSourceImpl(api: getIt<DioConsumer>())));
  getIt.registerSingleton<PestDetectionRepoImpl>(PestDetectionRepoImpl(
      pestDetectionRemoteDataSource:
          PestDetectionRemoteDataSourceImpl(api: getIt<DioConsumer>())));
  getIt.registerSingleton<SensorInfoRepoImpl>(SensorInfoRepoImpl(
      remoteDataSource:
          SoilInfoRemoteDataSourceImpl(api: getIt<DioConsumer>())));

  // Add Product dependencies
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
        remoteDataSource: getIt<ProductRemoteDataSource>()),
  );
  getIt.registerLazySingleton<AddProduct>(
    () => AddProduct(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<AddProductCubit>(
    () => AddProductCubit(addProductUseCase: getIt<AddProduct>()),
  );

  // Update Product dependencies
  getIt.registerLazySingleton<UpdateProductRemoteDataSource>(
    () => UpdateProductRemoteDataSourceImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<UpdateProductRepository>(
    () => UpdateProductRepositoryImpl(
      remoteDataSource: getIt<UpdateProductRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<UpdateProduct>(
    () => UpdateProduct(getIt<UpdateProductRepository>()),
  );
  getIt.registerLazySingleton<UpdateProductCubit>(
    () => UpdateProductCubit(updateProductUseCase: getIt<UpdateProduct>()),
  );

  // My Products dependencies
  getIt.registerLazySingleton<MyProductsRemoteDataSource>(
    () => MyProductsRemoteDataSourceImpl(
      apiConsumer: getIt<DioConsumer>(),
      api: getIt<DioConsumer>(),
    ),
  );
  getIt.registerLazySingleton<MyProductsRepository>(
    () => MyProductsRepositoryImpl(
      remoteDataSource: getIt<MyProductsRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetMyProducts>(
    () => GetMyProducts(getIt<MyProductsRepository>()),
  );
  getIt.registerLazySingleton<DeleteMyProduct>(
    () => DeleteMyProduct(getIt<MyProductsRepository>()),
  );
  getIt.registerFactory<MyProductsCubit>(
    () => MyProductsCubit(
      getIt<GetMyProducts>(),
      getIt<DeleteMyProduct>(),
      getMyProductsUseCase: getIt<GetMyProducts>(),
      deleteMyProductUseCase: getIt<DeleteMyProduct>(),
    ),
  );
}
