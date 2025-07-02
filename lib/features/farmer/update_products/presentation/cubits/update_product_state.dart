part of 'update_product_cubit.dart';

abstract class UpdateProductState extends Equatable {
  const UpdateProductState();

  @override
  List<Object> get props => [];
}

class UpdateProductInitial extends UpdateProductState {}

class UpdateProductLoading extends UpdateProductState {}

class UpdateProductSuccess extends UpdateProductState {
  final String message;

  const UpdateProductSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateProductError extends UpdateProductState {
  final String message;

  const UpdateProductError(this.message);

  @override
  List<Object> get props => [message];
}
