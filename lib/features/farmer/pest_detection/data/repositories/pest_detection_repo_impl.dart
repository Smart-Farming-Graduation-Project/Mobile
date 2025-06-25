import 'dart:io';

import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/features/farmer/pest_detection/data/datasources/pest_detection_remote_data_source.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_info_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/repositories/pest_detection_repo.dart';
import 'package:dartz/dartz.dart';

class PestDetectionRepoImpl implements PestDetectionRepo {
  final PestDetectionRemoteDataSource pestDetectionRemoteDataSource;
  PestDetectionRepoImpl({required this.pestDetectionRemoteDataSource});
  @override
  Future<Either<FailureModel, PestDetectionImageEntity>> getPestDetectionImage(
      File image) async {
    try {
      final response =
          await pestDetectionRemoteDataSource.getPestDetectionImage(image);
      return Right(response);
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureModel, List<PestDetectionInfoEntity>>>
      getPestDetectionInfo(String imageId) async {
    try {
      final response = await pestDetectionRemoteDataSource
          .getPestDetectionImageInfo(imageId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(FailureModel(message: e.errorModel.errorMessage));
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }
}
