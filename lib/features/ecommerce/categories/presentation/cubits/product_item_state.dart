class ProductItemState {
}

class ProductItemInitial extends ProductItemState {}

class ProductItemLoading extends ProductItemState {}

class AddingProductToCartSuccess extends ProductItemState {
  final String message;
  AddingProductToCartSuccess({required this.message});
}

class AddingProductToCartFailed extends ProductItemState {
  final String message;
  AddingProductToCartFailed({required this.message});
}
