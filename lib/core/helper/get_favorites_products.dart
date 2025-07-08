import 'dart:math';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/global_variables.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';

Future<void> getFavoritesProducts() async {
final api = getIt<DioConsumer>();
    try {
      final favoritesResponse = await api.get(EndPoints.getFavorites);
      favorites.clear();
      for (var element in favoritesResponse[ApiKeys.data]
          [ApiKeys.favoriteProducts]) {
        favorites.add(FavoriteProductModel.fromJson(element));
      }
    } on ServerException catch (e) {
      favorite = [];
      log(e.errorModel.errorMessage);
    }
  }