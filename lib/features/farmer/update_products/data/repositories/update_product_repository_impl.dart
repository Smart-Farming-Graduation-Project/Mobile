import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/update_product_entity.dart';
import '../../domain/repositories/update_product_repository.dart';
import '../datasources/update_product_remote_data_source.dart';
import '../models/update_product_model.dart';

class UpdateProductRepositoryImpl implements UpdateProductRepository {
  final UpdateProductRemoteDataSource remoteDataSource;

  UpdateProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<FailureModel, String>> updateProduct(
      UpdateProductEntity product) async {
    try {
      final productModel = UpdateProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        quantity: product.quantity,
        category: product.category,
        images: product.images,
        isAvailable: product.isAvailable,
      );

      final result = await remoteDataSource.updateProduct(productModel);
      return Right(result);
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }
}
