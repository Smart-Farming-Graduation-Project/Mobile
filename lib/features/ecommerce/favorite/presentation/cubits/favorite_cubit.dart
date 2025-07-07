import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/global_variables.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_state.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  final api = getIt<DioConsumer>();
  void addToFavorites(ProductModel product) async {
    favorites.add(FavoriteProductModel.fromJson(product.toJson()));
    final response =
        await api.post(EndPoints.addToFavorites(product.productId));
    if (response[ApiKeys.succeeded] == false) {
      favorites.remove(FavoriteProductModel.fromJson(product.toJson()));
      emit(FavoriteError(response[ApiKeys.message]));
    } else {
      emit(FavoriteSuccess(favorites));
    }
  }

  void removeFromFavorites(ProductModel product) async {
    favorites.remove(FavoriteProductModel.fromJson(product.toJson()));
    final response =
        await api.delete(EndPoints.removeFromFavorites(product.productId));
    if (response[ApiKeys.succeeded] == false) {
      favorites.add(FavoriteProductModel.fromJson(product.toJson()));
      emit(FavoriteError(response[ApiKeys.message]));
    } else {
      loadFavorites();
    }
  }

  Future<void> loadFavorites() async {
    try {
      favorites.clear(); // Clear any previous data
      emit(FavoriteLoading());
      final response = await api.get(EndPoints.getFavorites);

      // Check if the response has data before proceeding
      if (response[ApiKeys.data] != null &&
          response[ApiKeys.data][ApiKeys.favoriteProducts] != null) {
        // Add all products to the list
        for (var element in response[ApiKeys.data][ApiKeys.favoriteProducts]) {
          favorites.add(FavoriteProductModel.fromJson(element));
        }
        if (favorites.isEmpty) {
          emit(FavoriteEmpty("No products found."));
        } else {
          emit(FavoriteSuccess(favorites));
        }
      } else {
        log("Invalid response format");
        emit(FavoriteError("Invalid response format"));
      }
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(FavoriteError(e.errorModel.errorMessage));
    } catch (e) {
      log("Error: $e");
      emit(FavoriteError("An unexpected error occurred."));
    }
  }
}
