import 'package:crop_guard/featurs/categories/presentation/models/category_products_model.dart';

class CategoryState {}
class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {
  final List<CategoryProductsModel> products;
  CategorySuccess(this.products);
}
class CategoryError extends CategoryState {
  final String error;
  CategoryError(this.error);
}
