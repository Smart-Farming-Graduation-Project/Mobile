import 'dart:developer';

import 'package:crop_guard/featurs/cart/manger/cubit/cart_state.dart';
import 'package:crop_guard/featurs/cart/manger/models/cart_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  void loadCart() async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    checkEmpty(cartProducts);
  }

  void removeItem(String productId) {
    cartProducts = List.from(cartProducts)
      ..removeWhere((element) => element.id == productId);
    log(cartProducts.map((e) => e.id).toString());
    checkEmpty(cartProducts);
  }

  void updateQuantity(String productId, int quantity, bool isIncrement) {
    if (isIncrement) {
      cartProducts.firstWhere((element) => element.id == productId).quantity++;
    } else {
      if (cartProducts
              .firstWhere((element) => element.id == productId)
              .quantity >
          1) {
        cartProducts
            .firstWhere((element) => element.id == productId)
            .quantity--;
      } else {
        removeItem(productId);
      }
    }

    log(cartProducts.map((e) => e.quantity).toString());

    checkEmpty(cartProducts);
  }

  void checkEmpty(List<CartProduct> cartProducts) {
    if (cartProducts.isEmpty) {
      emit(CartEmptyState());
    } else {
      emit(CartLoadedState(cartProducts));
    }
  }
}
