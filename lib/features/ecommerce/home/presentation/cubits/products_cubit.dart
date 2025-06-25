import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final api = getIt<DioConsumer>();

  Future<void> getAllProducts() async {
    log('getAllProducts');
    emit(ProductsLoading());
    try {
      final response = await api.get(EndPoints.getProducts);
      List<ProductModel> products = [];

      if (response[ApiKeys.data] != null) {
        for (var element in response[ApiKeys.data]) {
          products.add(ProductModel.fromJson(element));
        }
      }

      if (products.isEmpty) {
        emit(ProductsEmpty());
      } else {
        emit(ProductsLoaded(products));
      }
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(ProductsError(e.errorModel.errorMessage));
    } catch (e) {
      log("Error: $e");
      emit(ProductsError("An unexpected error occurred."));
    }
  }
}
