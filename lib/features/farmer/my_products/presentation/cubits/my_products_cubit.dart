import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/my_product_entity.dart';
import '../../domain/usecases/get_my_products.dart';
import '../../domain/usecases/delete_my_product.dart';

part 'my_products_state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  final GetMyProducts getMyProductsUseCase;
  final DeleteMyProduct deleteMyProductUseCase;
  List<MyProductEntity> products = [];
  int currentPage = 1;

  MyProductsCubit(
    {
    required this.getMyProductsUseCase,
    required this.deleteMyProductUseCase,
  }) : super(MyProductsInitial());

  Future<void> getMyProducts({int pageNumber = 1, int pageSize = 10}) async {
    emit(MyProductsLoading());
    final params =
        GetMyProductsParams(pageNumber: pageNumber, pageSize: pageSize);
    final result = await getMyProductsUseCase(params);
    result.fold(
      (failure) => emit(MyProductsError(failure.message)),
      (products) {
        currentPage = pageNumber;
        this.products = products;
        emit(MyProductsLoaded(products,
            currentPage: pageNumber, hasMoreData: products.length >= pageSize));
      },
    );
  }

  Future<void> loadMoreProducts() async {
    final currentState = state;
    if (currentState is MyProductsLoaded && currentState.hasMoreData) {
      final nextPage = currentState.currentPage + 1;
      final params = GetMyProductsParams(pageNumber: nextPage, pageSize: 10);
      final result = await getMyProductsUseCase(params);
      result.fold(
        (failure) => emit(MyProductsError(failure.message)),
        (newProducts) {
          if (newProducts.isNotEmpty) {
            final allProducts = [...currentState.products, ...newProducts];
            emit(MyProductsLoaded(
              allProducts,
              currentPage: nextPage,
              hasMoreData: newProducts.length >= 10,
            ));
          } else {
            emit(MyProductsLoaded(
              currentState.products,
              currentPage: currentState.currentPage,
              hasMoreData: false,
            ));
          }
        },
      );
    }
  }

  Future<void> deleteProduct(int productId) async {
    emit(DeleteProductLoading());

    final result = await deleteMyProductUseCase(productId);
    result.fold(
      (failure) => emit(DeleteProductError(failure.message)),
      (success) => emit(const DeleteProductSuccess()),
    );
  }

  void resetState() {
    emit(MyProductsInitial());
  }
}
