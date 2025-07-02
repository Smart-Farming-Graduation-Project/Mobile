import 'package:dartz/dartz.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/parm_use_case.dart';
import '../entities/my_product_entity.dart';
import '../repositories/my_products_repository.dart';

class GetMyProductsParams {
  final int pageNumber;
  final int pageSize;

  GetMyProductsParams({this.pageNumber = 1, this.pageSize = 10});
}

class GetMyProducts
    implements UseCase<List<MyProductEntity>, GetMyProductsParams> {
  final MyProductsRepository repository;

  GetMyProducts(this.repository);

  @override
  Future<Either<FailureModel, List<MyProductEntity>>> call(
      GetMyProductsParams params) async {
    return await repository.getMyProducts(
        pageNumber: params.pageNumber, pageSize: params.pageSize);
  }
}
