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
    try {
      favorites.add(FavoriteProductModel.fromJson(product.toJson()));
      emit(FavoriteSuccess(favorites));

      await api.post(EndPoints.addToFavorites(product.productId));
    } on ServerException catch (e) {
      favorites.remove(FavoriteProductModel.fromJson(product.toJson()));

      emit(FavoriteError(e.errorModel.errorMessage));
    } catch (e) {
      emit(FavoriteError("An unexpected error occurred."));
    }
  }

  void removeFromFavorites(ProductModel product) async {
    try {
      favorites.remove(
        favorites.firstWhere(
          (favorite) => favorite.productId == product.productId,
        ),
      );
      emit(FavoriteSuccess(favorites));
      await api.delete(EndPoints.removeFromFavorites(product.productId));
    } on ServerException catch (e) {
      favorites.add(FavoriteProductModel.fromJson(product.toJson()));
      emit(FavoriteError(e.errorModel.errorMessage));
    } catch (e) {
      emit(FavoriteError("An unexpected error occurred."));
    }
  }

  Future<void> loadFavorites() async {
    try {
      emit(FavoriteSuccess(favorites));
      final response = await api.get(EndPoints.getFavorites);
      favorites.clear(); // Clear any previous data

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
