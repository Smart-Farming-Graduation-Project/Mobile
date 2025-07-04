import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/update_product_entity.dart';
import '../../domain/usecases/update_product.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  final UpdateProduct updateProductUseCase;

  UpdateProductCubit({required this.updateProductUseCase})
      : super(UpdateProductInitial());

  Future<void> updateProduct(UpdateProductEntity product) async {
    // Check if cubit is still active before emitting
    if (!isClosed) {
      emit(UpdateProductLoading());
    }

    try {
      final result = await updateProductUseCase(product);

      // Check if cubit is still active before emitting result
      if (!isClosed) {
        result.fold(
          (failure) => emit(UpdateProductError(failure.message)),
          (success) => emit(UpdateProductSuccess(success)),
        );
      }
    } catch (e) {
      // Check if cubit is still active before emitting error
      if (!isClosed) {
        emit(UpdateProductError(e.toString()));
      }
    }
  }

  void resetState() {
    if (!isClosed) {
      emit(UpdateProductInitial());
    }
  }
}
