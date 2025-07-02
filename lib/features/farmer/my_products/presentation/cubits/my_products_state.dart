part of 'my_products_cubit.dart';

abstract class MyProductsState extends Equatable {
  const MyProductsState();

  @override
  List<Object?> get props => [];
}

class MyProductsInitial extends MyProductsState {}

class MyProductsLoading extends MyProductsState {}

class MyProductsLoaded extends MyProductsState {
  final List<MyProductEntity> products;
  final int currentPage;
  final bool hasMoreData;

  const MyProductsLoaded(this.products,
      {this.currentPage = 1, this.hasMoreData = true});

  @override
  List<Object?> get props => [products, currentPage, hasMoreData];
}

class MyProductsError extends MyProductsState {
  final String message;

  const MyProductsError(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteProductLoading extends MyProductsState {}

class DeleteProductSuccess extends MyProductsState {

  const DeleteProductSuccess();

  @override
  List<Object?> get props => [];
}

class DeleteProductError extends MyProductsState {
  final String message;

  const DeleteProductError(this.message);

  @override
  List<Object?> get props => [message];
}
