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
    emit(UpdateProductLoading());

    final result = await updateProductUseCase(product);
    result.fold(
      (failure) => emit(UpdateProductError(failure.message)),
      (success) => emit(UpdateProductSuccess(success)),
    );
  }

  void resetState() {
    emit(UpdateProductInitial());
  }
}
