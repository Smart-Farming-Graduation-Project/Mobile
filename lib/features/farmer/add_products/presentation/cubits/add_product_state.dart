part of 'add_product_cubit.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object?> get props => [];
}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final String message;

  const AddProductSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AddProductError extends AddProductState {
  final String message;

  const AddProductError(this.message);

  @override
  List<Object?> get props => [message];
}
