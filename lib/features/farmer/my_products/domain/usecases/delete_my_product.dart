import 'package:dartz/dartz.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/parm_use_case.dart';
import '../repositories/my_products_repository.dart';

class DeleteMyProduct implements UseCase<void, int> {
  final MyProductsRepository repository;

  DeleteMyProduct(this.repository);

  @override
  Future<Either<FailureModel, void>> call(int productId) async {
    return await repository.deleteMyProduct(productId);
  }
}
