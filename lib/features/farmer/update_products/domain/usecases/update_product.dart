import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/update_product_entity.dart';
import '../repositories/update_product_repository.dart';

class UpdateProduct {
  final UpdateProductRepository repository;

  UpdateProduct(this.repository);

  Future<Either<FailureModel, String>> call(UpdateProductEntity product) async {
    return await repository.updateProduct(product);
  }
}
