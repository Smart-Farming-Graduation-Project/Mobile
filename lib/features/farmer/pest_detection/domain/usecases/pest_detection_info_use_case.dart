import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/parm_use_case.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/entities/pest_detection_info_entity.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/repositories/pest_detection_repo.dart';
import 'package:dartz/dartz.dart';

class PestDetectionInfoUseCase
    extends UseCase<List<PestDetectionInfoEntity>, String> {
  final PestDetectionRepo pestDetectionRepo;

  PestDetectionInfoUseCase({required this.pestDetectionRepo});

  @override
  Future<Either<FailureModel, List<PestDetectionInfoEntity>>> call(
      String imageId) {
    return pestDetectionRepo.getPestDetectionInfo(imageId);
  }
}
