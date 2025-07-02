import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/add_product_to_cart.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/cubits/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
  final api = getIt<DioConsumer>();

  Future<void> loadCart() async {
    emit(CartLoadingState());
    fetchCartProducts();
  }

  Future<void> removeFromCart(int productId) async {
    try {
      emit(CartLoadingState());
      final response = await api.delete(EndPoints.removeFromCart(productId));
      log(response.toString());
      loadCart();
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(CartErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }

  Future<void> addToCart(int productId) async {
    try {
      emit(CartLoadingState());
      final response = await addProductToCart(productId);
      log(response.toString());
      fetchCartProducts();
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(CartErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }

  Future<void> updateCart(int productId, int quantity) async {
    try {
      final response = await api.post(EndPoints.addToCart(productId),
          queryParameters: {ApiKeys.quantity: quantity});
      log(response.toString());
      fetchCartProducts(); // Updated from fe() to fetchCartProducts()
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(CartErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }

  void fetchCartProducts() async {
    try {
      final response = await api.get(
        EndPoints.getCart,
      );
      log(response['data']['cartItems'].toString());

      List<CartProductModel> cartProductsList = [];
      for (var product in response['data']['cartItems']) {
        cartProductsList.add(CartProductModel.fromJson(product));
      }
      checkEmpty(cartProductsList);
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(CartErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }

  void checkEmpty(List<CartProductModel> cartProducts) {
    log(cartProducts.length.toString());
    if (cartProducts.isEmpty) {
      emit(CartEmptyState());
    } else {
      emit(CartLoadedState(cartProducts, calculateSubTotalPrice(cartProducts)));
    }
  }

  double calculateSubTotalPrice(List<CartProductModel> cartProducts) {
    double subTotalPrice = 0;
    for (var product in cartProducts) {
      subTotalPrice += product.productPrice * product.quantity;
    }
    return subTotalPrice;
  }
}
