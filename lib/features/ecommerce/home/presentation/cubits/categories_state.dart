import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';

class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesEmpty extends CategoriesState {}

class CategoriesError extends CategoriesState {
  final String errorMessage;
  CategoriesError(this.errorMessage);
}
