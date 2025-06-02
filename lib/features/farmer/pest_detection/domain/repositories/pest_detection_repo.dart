import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_info_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class PestDetectionRepo {
  Future<Either<FailureModel, PestDetectionImageEntity>> getPestDetectionImage(MultipartFile image);
  Future<Either<FailureModel, PestDetectionInfoEntity>> getPestDetectionInfo(int imageId);
}
