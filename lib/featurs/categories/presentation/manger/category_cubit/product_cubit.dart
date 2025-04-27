import 'package:crop_guard/featurs/categories/presentation/manger/helper/products_list.dart';
import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<List<ProductModel>> {
  final List<ProductModel> allProducts = List.from(productsList);
  String currentCategory = "All";

  ProductCubit() : super(List.from(productsList));

  void getProductsByCategory(String categoryName) {
    currentCategory = categoryName;
    if (categoryName == "All") {
      emit(List.from(allProducts));
    } else {
      final filteredProducts = allProducts
          .where((product) => product.category == categoryName)
          .toList();
      emit(List.from(filteredProducts));
    }
  }

  void toggleFavorite(String productId) {
    for (var product in allProducts) {
      if (productId == product.id.toString()) {
        product.isFavorite = !product.isFavorite;
        break;
      }
    }
    getProductsByCategory(currentCategory);
  }

  List<ProductModel> getFavoriteProducts() {
    return allProducts.where((product) => product.isFavorite).toList();
  }
}
