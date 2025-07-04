// import 'package:dartz/dartz.dart';
// import '../entities/product.dart';
// import '../repositories/product_repository.dart';
// import '../../../../core/error/failures.dart';

import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

class AddProduct {
  final ProductRepository repository;

  AddProduct(this.repository);

  Future<Either<FailureModel, String>> call(ProductEntity product) async {
    return await repository.addProduct(product);
  }
}
