// import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class FavoriteCubit extends Cubit<List<ProductModel>> {
//   FavoriteCubit() : super([]);
//
//   void toggleFavorite(ProductModel product) {
//     if (state.contains(product)) {
//       emit(state.where((p) => p.id != product.id).toList());
//     } else {
//       emit([...state, product]);
//     }
//   }
//
//   bool isFavorite(ProductModel product) {
//     return state.contains(product);
//   }
// }
