import 'package:crop_guard/featurs/cart/manger/cubit/cart_state.dart';
import 'package:crop_guard/featurs/cart/manger/models/cart_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
  //demo data for cart
  List<CartProduct> cartProducts = [
    CartProduct(
      id: "1",
      title: "Product 1",
      quantity: 1,
      currentPrice: 10.0,
      originalPrice: 20.0,
      imageUrl:
          "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
      category: "Category 1",
    ),
    CartProduct(
      id: "2",
      title: "Product 2",
      quantity: 2,
      currentPrice: 15.0,
      originalPrice: 25.0,
      imageUrl:
          "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
      category: "Category 2",
    ),
    CartProduct(
      id: "3",
      title: "Product 3",
      quantity: 3,
      currentPrice: 20.0,
      originalPrice: 30.0,
      imageUrl:
          "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
      category: "Category 3",
    ),
    CartProduct(
      id: "4",
      title: "Product 4",
      quantity: 4,
      currentPrice: 25.0,
      originalPrice: 35.0,
      imageUrl:
          "https://i5.walmartimages.com/seo/Fresh-Slicing-Tomato-Each_a1e8e44a-2b82-48ab-9c09-b68420f6954c.04f6e0e87807fc5457f57e3ec0770061.jpeg",
      category: "Category 4",
    ),
  ];

  void loadCart() async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    checkEmpty();
  }

  void removeItem(String productId) {
    cartProducts.removeWhere((element) => element.id == productId);
    checkEmpty();
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
      }
    }
    checkEmpty();
  }

  void checkEmpty() {
    if (cartProducts.isEmpty) {
      emit(CartEmptyState());
    }
    emit(CartLoadedState(cartProducts));
  }
}
