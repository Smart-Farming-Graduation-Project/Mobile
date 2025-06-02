import 'package:crop_guard/core/models/product_model.dart';

class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryEmpty extends CategoryState {
  final String message;
  CategoryEmpty(this.message);
}

class CategorySuccess extends CategoryState {
  final List<ProductModel> products;
  CategorySuccess(this.products);
}

class CategoryError extends CategoryState {
  final String error;
  CategoryError(this.error);
}
