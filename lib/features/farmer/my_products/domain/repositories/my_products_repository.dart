import 'package:dartz/dartz.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import '../entities/my_product_entity.dart';

abstract class MyProductsRepository {
  Future<Either<FailureModel, List<MyProductEntity>>> getMyProducts(
      {int pageNumber = 1, int pageSize = 10});
  Future<Either<FailureModel, MyProductEntity>> getMyProductById(int productId);
  Future<Either<FailureModel, bool>> deleteMyProduct(int productId);
  Future<Either<FailureModel, MyProductEntity>> updateMyProduct(
      MyProductEntity product);
}
