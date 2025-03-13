import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/models/product_model.dart';

class ProductCubit extends Cubit<List<ProductModel>> {
  final List<ProductModel> allProducts = List.from(products);
  String currentCategory = "All";

  ProductCubit() : super(List.from(products));

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
      if (product.id == productId) {
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
