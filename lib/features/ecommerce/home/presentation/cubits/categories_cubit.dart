import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final api = getIt<DioConsumer>();

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final response = await api.get(EndPoints.getCategories);
      List<CategoryModel> categories = [];

      if (response[ApiKeys.data] != null) {
        for (var element in response[ApiKeys.data]) {
          categories.add(CategoryModel.fromJson(element));
        }
      }

      if (categories.isEmpty) {
        emit(CategoriesEmpty());
      } else {
        emit(CategoriesLoaded(categories));
      }
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(CategoriesError(e.errorModel.errorMessage));
    } catch (e) {
      log("Error: $e");
      emit(CategoriesError("An unexpected error occurred."));
    }
  }
}
