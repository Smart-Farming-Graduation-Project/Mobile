
import 'package:crop_guard/features/ecommerce/favorite/presentation/models/favorite_product_model.dart';

class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<FavoriteProductModel> favoriteProducts;
  FavoriteSuccess(this.favoriteProducts);
}

class FavoriteError extends FavoriteState {
  final String errorMessage;
  FavoriteError(this.errorMessage);
}

class FavoriteEmpty extends FavoriteState {
  final String message;
  FavoriteEmpty(this.message);
}
