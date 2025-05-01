import 'package:crop_guard/featurs/ecommerce/cart/manger/models/cart_product_model.dart';

class CartState {}
class CartInitialState extends CartState {}
class CartLoadingState extends CartState {}
class CartLoadedState extends CartState {
  final List<CartProductModel> items;
  final double subTotalPrice;
  CartLoadedState(this.items, this.subTotalPrice);
}
class CartErrorState extends CartState {
  final String errorMessage;
  CartErrorState({required this.errorMessage});
}
class CartEmptyState extends CartState {}
