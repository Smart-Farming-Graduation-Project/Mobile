import 'package:crop_guard/core/models/product_model.dart';

class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final ProductModel products;
  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  final String errorMessage;
  ProductErrorState(this.errorMessage);
}

class ProductEmptyState extends ProductState {}
