import 'package:crop_guard/core/models/product_model.dart';

class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<ProductModel> favoriteProducts;
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
