class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class ProductAddedToCart extends AddToCartState {}

class ProductNotAddedToCart extends AddToCartState {}

class AddingProductToCartFailure extends AddToCartState {
  final String errorMessage;

  AddingProductToCartFailure({required this.errorMessage});
}
