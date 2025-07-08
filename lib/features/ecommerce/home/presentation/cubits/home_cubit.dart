import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/global_variables.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';
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

  Future<void> getFavoritesProducts() async {
    try {
      final favoritesResponse = await api.get(EndPoints.getFavorites);    
      favorites.clear();
      for (var element in favoritesResponse[ApiKeys.data]
          [ApiKeys.favoriteProducts]) {
        favorites.add(FavoriteProductModel.fromJson(element));
      }
    } on ServerException catch (e) {
      emit(HomeError(e.errorModel.errorMessage));
    }
  }
}
