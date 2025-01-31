import 'package:crop_guard/featurs/cart/manger/models/cart_product.dart';

class CartState {}
class CartInitialState extends CartState {}
class CartLoadingState extends CartState {}
class CartLoadedState extends CartState {
  final List<CartProduct> items;
  CartLoadedState(this.items);
}
class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}
class CartEmptyState extends CartState {}
