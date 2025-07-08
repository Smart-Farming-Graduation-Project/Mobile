import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/popular_products/manger/cubit/popular_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularProductsCubit extends Cubit<PopularProductsState> {
  PopularProductsCubit() : super(PopularProductsInitial());
  final ApiConsumer api = getIt<DioConsumer>();

  Future<void> loadPopularProducts({
    int pageNumber = 1,
  }) async {
    emit(PopularProductsLoading());
    try {
      final response =
          await api.get(EndPoints.getPopularProducts, queryParameters: {
        'pageNumber': pageNumber,
        'pageSize': 20,
      });
      final products = (response[ApiKeys.data] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
      if (products.isEmpty) {
        emit(PopularProductsEmpty());
      } else {
        emit(PopularProductsLoaded(productsList: products));
      }
    } on ServerException catch (e) {
      emit(PopularProductsError(error: e.errorModel.errorMessage));
    } catch (e) {
      emit(PopularProductsError(error: e.toString()));
    }
  }
}
