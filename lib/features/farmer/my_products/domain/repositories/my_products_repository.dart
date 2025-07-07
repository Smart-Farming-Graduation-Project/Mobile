import 'package:dartz/dartz.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import '../entities/my_product_entity.dart';

abstract class MyProductsRepository {
  Future<Either<FailureModel, List<MyProductEntity>>> getMyProducts(
      {int pageNumber = 1, int pageSize = 10});
  Future<Either<FailureModel, void>> deleteMyProduct(int productId);
}
