import 'package:crop_guard/core/models/product_model.dart';

sealed class PopularProductsState {}

class PopularProductsInitial extends PopularProductsState {}

class PopularProductsLoading extends PopularProductsState {}

class PopularProductsLoaded extends PopularProductsState {
  final List<ProductModel> productsList;
  PopularProductsLoaded({required this.productsList});
}

class PopularProductsError extends PopularProductsState {
  final String error;
  PopularProductsError({required this.error});
}

class PopularProductsEmpty extends PopularProductsState {}