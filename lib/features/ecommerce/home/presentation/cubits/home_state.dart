import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';

class HomeState {}

class HomeInitial extends HomeState {
  HomeInitial();
}

class HomeHeaderLoading extends HomeState {
  HomeHeaderLoading();
}

class HomeHeaderLoaded extends HomeState {
  final int pageIndex;
  HomeHeaderLoaded(this.pageIndex);
}

class HomeHeaderError extends HomeState {
  final String errorMessage;
  HomeHeaderError(this.errorMessage);
}

class CategoriesLoading extends HomeState {
  CategoriesLoading();
}

class CategoriesLoaded extends HomeState {
  final List<CategoryModel> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends HomeState {
  final String errorMessage;
  CategoriesError(this.errorMessage);
}

class CategoriesEmpty extends HomeState {
  CategoriesEmpty();
}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeLoaded extends HomeState {
  final int pageIndex;
  HomeLoaded(this.pageIndex);
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}

class HomeEmpty extends HomeState {
  HomeEmpty();
}

class ProductsLoading extends HomeState {}

class ProductsLoaded extends HomeState {
  final List<ProductModel> products;
  ProductsLoaded(this.products);
}

class ProductsEmpty extends HomeState {
  ProductsEmpty();
}

class ProductsError extends HomeState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}
