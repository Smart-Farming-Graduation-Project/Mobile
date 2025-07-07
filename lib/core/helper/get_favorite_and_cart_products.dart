import 'dart:developer';

import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/global_variables.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart' as cart_model;

Future<void> getFavoritesAndCartProducts() async {
  final api = getIt<DioConsumer>();
    try {
      final favoritesResponse = await api.get(EndPoints.getFavorites);
      final cartProductsResponse = await api.get(EndPoints.getCart);
      favorites.clear();
      cartProductsList.clear();
      for (var element in favoritesResponse[ApiKeys.data]
          [ApiKeys.favoriteProducts]) {
        favorites.add(FavoriteProductModel.fromJson(element));
      }
      for (var product in cartProductsResponse[ApiKeys.data]
          [ApiKeys.cartItems]) {
        cartProductsList.add(cart_model.CartProductModel.fromJson(product));
      }
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
    }
  }