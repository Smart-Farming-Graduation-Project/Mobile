import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/add_product_to_cart.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/cubits/product_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemCubit extends Cubit<ProductItemState> {
  ProductItemCubit() : super(ProductItemInitial());

  Future<void> addToCart(int productId) async {
    emit(ProductItemLoading());
    try {
      final response = await addProductToCart(productId);
      emit(AddingProductToCartSuccess(message: response[ApiKeys.data]));
    } on ServerException catch (e) {
      emit(AddingProductToCartFailed(message: e.errorModel.errorMessage));
    }
  }
}
