import 'package:dartz/dartz.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import '../../domain/entities/my_product_entity.dart';
import '../../domain/repositories/my_products_repository.dart';
import '../datasources/my_products_remote_data_source.dart';

class MyProductsRepositoryImpl implements MyProductsRepository {
  final MyProductsRemoteDataSource remoteDataSource;

  MyProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<FailureModel, List<MyProductEntity>>> getMyProducts(
      {int pageNumber = 1, int pageSize = 10}) async {
    try {
      final products = await remoteDataSource.getMyProducts(
          pageNumber: pageNumber, pageSize: pageSize);
      return Right(products);
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureModel, MyProductEntity>> getMyProductById(
      int productId) async {
    try {
      final product = await remoteDataSource.getMyProductById(productId);
      return Right(product);
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureModel, bool>> deleteMyProduct(int productId) async {
    try {
      final result = await remoteDataSource.deleteMyProduct(productId);
      return Right(result);
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureModel, MyProductEntity>> updateMyProduct(
      MyProductEntity product) async {
    try {
      final updatedProduct =
          await remoteDataSource.updateMyProduct(product as dynamic);
      return Right(updatedProduct);
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }
}
