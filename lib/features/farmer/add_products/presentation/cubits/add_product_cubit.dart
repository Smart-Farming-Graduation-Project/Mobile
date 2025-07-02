import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/add_product.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProduct addProductUseCase;

  AddProductCubit({required this.addProductUseCase})
      : super(AddProductInitial());

  Future<void> addProduct(ProductEntity product) async {
    if (!isClosed) {
      emit(AddProductLoading());
    }

    try {
      final result = await addProductUseCase(product);

      if (!isClosed) {
        result.fold(
          (failure) => emit(AddProductError(failure.message)),
          (success) => emit(AddProductSuccess(success)),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(AddProductError(e.toString()));
      }
    }
  }

  void resetState() {
    if (!isClosed) {
      emit(AddProductInitial());
    }
  }
}
