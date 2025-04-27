import 'dart:developer';

import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/categories/presentation/manger/category_cubit/category_state.dart';
import 'package:crop_guard/featurs/categories/presentation/models/category_products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final api = getIt<DioConsumer>();
  List<CategoryProductsModel> categoryProductsList = [];
  // void filterCategories(String query) {
  //   state.text = query;
  //   emit(state);
  // }
  Future<void> loadCategoriesProducts(String id) async {
    emit(CategoryLoading());
    categoryProductsList.clear(); // Clear any previous data
    try {
      final response = await api.get(EndPoints.getCategoryProducts(id));

      // Check if the response has data before proceeding
      if (response[ApiKeys.data] != null &&
          response[ApiKeys.data][ApiKeys.products] != null) {
        // Add all products to the list
        for (var element in response[ApiKeys.data][ApiKeys.products]) {
          categoryProductsList.add(CategoryProductsModel.fromJson(element));
        }
        emit(CategorySuccess(categoryProductsList));
      } else {
        log("Invalid response format");
        emit(CategoryError("Invalid response format"));
      }
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(CategoryError(e.errorModel.errorMessage));
    } catch (e) {
      log("Error: $e");
      emit(CategoryError("An unexpected error occurred."));
    }
  }

  
}
