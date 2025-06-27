import 'package:crop_guard/core/models/product_model.dart';

class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  ProductsLoaded(this.products);
}

class ProductsEmpty extends ProductsState {}

class ProductsError extends ProductsState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}
