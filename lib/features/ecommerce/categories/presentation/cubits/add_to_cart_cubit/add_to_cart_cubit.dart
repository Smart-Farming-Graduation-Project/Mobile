import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/add_product_to_cart.dart';
import 'package:crop_guard/core/helper/global_variables.dart';
import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/add_to_cart_cubit/add_to_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());
  void checkIfProductIsAddedToCart(int productId) {
    cartProductsList.any((element) => element.productId == productId)
        ? emit(ProductAddedToCart())
        : emit(ProductNotAddedToCart());
  }

  Future<void> addProductToCart(ProductModel product) async {
    try {
      cartProductsList.add(CartProductModel(
          id: 0,
          productId: product.productId,
          productName: product.productName,
          productDescription: product.productDescription,
          productPrice: product.productPrice,
          quantity: 1,
          productImage: product.productImages.first));
      emit(ProductAddedToCart());
      await addProductToServerCart(product.productId);
    } on ServerException catch (e) {
      cartProductsList.removeWhere((element) => element.productId == product.productId);
      emit(AddingProductToCartFailure(errorMessage: e.errorModel.errorMessage));
    }
  }
}
