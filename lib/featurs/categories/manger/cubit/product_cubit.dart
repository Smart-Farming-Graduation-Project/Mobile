import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/models/product_model.dart';

class ProductCubit extends Cubit<List<ProductModel>> {
  ProductCubit() : super([]);


  void getProductsByCategory(String categoryName) {
    final filteredProducts = products.where((product) => product.category == categoryName).toList();
    emit(filteredProducts);
  }


  void toggleFavorite(ProductModel product) {
    product.isFavorite = !product.isFavorite;

    final updatedProducts = List<ProductModel>.from(state);
    emit(updatedProducts);
  }


  List<ProductModel> getFavoriteProducts() {
    return state.where((product) => product.isFavorite).toList();
  }
}
