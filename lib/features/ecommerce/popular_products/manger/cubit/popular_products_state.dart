import 'package:crop_guard/core/models/product_model.dart';

sealed class PopularProductsState {}

class PopularProductsInitial extends PopularProductsState {}

class PopularProductsLoading extends PopularProductsState {}

class PopularProductsLoadingMore extends PopularProductsState {
  final List<ProductModel> productsList;
  PopularProductsLoadingMore({required this.productsList});
}

class PopularProductsLoaded extends PopularProductsState {
  final List<ProductModel> productsList;
  final bool hasReachedMax;
  final int currentPage;

  PopularProductsLoaded({
    required this.productsList,
    this.hasReachedMax = false,
    this.currentPage = 1,
  });
}

class PopularProductsError extends PopularProductsState {
  final String error;
  PopularProductsError({required this.error});
}

class PopularProductsEmpty extends PopularProductsState {}
