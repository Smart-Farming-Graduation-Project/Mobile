import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/cubits/favorite_state.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  final api = getIt<DioConsumer>();
  List<FavoriteProductModel> favoriteProducts = [];
  void addToFavorites(ProductModel product) async {
    favoriteProducts.add(FavoriteProductModel.fromJson(product.toJson()));
    final response =
        await api.post(EndPoints.addToFavorites(product.productId));
    if (response[ApiKeys.succeeded] == false) {
      favoriteProducts.remove(FavoriteProductModel.fromJson(product.toJson()));
      emit(FavoriteError(response[ApiKeys.message]));
    } else {
      emit(FavoriteSuccess(favoriteProducts));
    }
  }

  void removeFromFavorites(ProductModel product) async {
    favoriteProducts.remove(FavoriteProductModel.fromJson(product.toJson()));
    final response =
        await api.delete(EndPoints.removeFromFavorites(product.productId));
    if (response[ApiKeys.succeeded] == false) {
      favoriteProducts.add(FavoriteProductModel.fromJson(product.toJson()));
      emit(FavoriteError(response[ApiKeys.message]));
    } else {
      loadFavorites();
    }
  }

  Future<void> loadFavorites() async {
    try {
      favoriteProducts.clear(); // Clear any previous data
      emit(FavoriteLoading());
      final response = await api.get(EndPoints.getFavorites);

      // Check if the response has data before proceeding
      if (response[ApiKeys.data] != null &&
          response[ApiKeys.data][ApiKeys.favoriteProducts] != null) {
        // Add all products to the list
        for (var element in response[ApiKeys.data][ApiKeys.favoriteProducts]) {
          favoriteProducts.add(FavoriteProductModel.fromJson(element));
        }
        if (favoriteProducts.isEmpty) {
          emit(FavoriteEmpty("No products found."));
        } else {
          emit(FavoriteSuccess(favoriteProducts));
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
