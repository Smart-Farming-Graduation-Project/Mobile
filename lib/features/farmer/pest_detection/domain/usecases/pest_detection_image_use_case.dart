import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/parm_use_case.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_image_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/repositories/pest_detection_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PestDetectionImageUseCase
    extends UseCase<PestDetectionImageEntity, MultipartFile> {
  final PestDetectionRepo pestDetectionRepo;

  PestDetectionImageUseCase({required this.pestDetectionRepo});

  @override
  Future<Either<FailureModel, PestDetectionImageEntity>> call(
      MultipartFile params) {
    return pestDetectionRepo.getPestDetectionImage(params);
  }
}
