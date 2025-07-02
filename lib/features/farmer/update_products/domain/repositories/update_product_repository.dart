import 'package:dartz/dartz.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import '../entities/update_product_entity.dart';

abstract class UpdateProductRepository {
  Future<Either<FailureModel, String>> updateProduct(
      UpdateProductEntity product);
}
