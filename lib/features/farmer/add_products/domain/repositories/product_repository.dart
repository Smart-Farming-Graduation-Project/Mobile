// import 'package:dartz/dartz.dart';
// import '../entities/product.dart';
// import '../../../../core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure_model.dart';
import '../../domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<FailureModel, String>> addProduct(ProductEntity product);
}
