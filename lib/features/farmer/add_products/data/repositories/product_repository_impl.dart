import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<FailureModel, String>> addProduct(ProductEntity product) async {
    try {
      // Convert entity to model
      final productModel = ProductModel(
        name: product.name,
        description: product.description,
        price: product.price,
        quantity: product.quantity,
        category: product.category,
        images: product.images,
        isAvailable: product.isAvailable,
      );

      // Call remote data source
      final result = await remoteDataSource.addProduct(productModel);

      return Right(result);
    } on ServerException catch (e) {
      return Left(FailureModel(message: e.errorModel.errorMessage.toString()));
    } on NetworkException catch (e) {
      return Left(FailureModel(message: e.message.toString()));
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }
}
