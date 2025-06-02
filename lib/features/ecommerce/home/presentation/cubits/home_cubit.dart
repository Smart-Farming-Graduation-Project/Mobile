import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/cubits/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final api = getIt<DioConsumer>();
  void changePage(int index) => emit(HomeLoaded(index));
  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      emit(HomeLoaded(0));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final response = await api.get(EndPoints.getCategories);
      List<CategoryModel> categories = [];
      for (var element in response[ApiKeys.data]) {
        categories.add(CategoryModel.fromJson(element));
      }
      if (categories.isEmpty) {
        emit(CategoriesEmpty());
      } else {
        emit(CategoriesLoaded(categories));
      }
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
