import 'dart:developer';

import 'package:crop_guard/core/errors/exceptions.dart';
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
    } on ServerException catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureModel, void>> deleteMyProduct(int productId) async {
    try {
      await remoteDataSource.deleteMyProduct(productId);
      await getMyProducts(pageNumber: 1, pageSize: 10);
      return const Right(null);
    } on ServerException catch (e) {
      log(e.errorModel.statusCode.toString());
      if (e.errorModel.statusCode == 500) {
        deleteMyProduct(productId);
      }
      return Left(FailureModel(message: e.toString()));
    }
  }
}
