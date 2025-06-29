import 'package:dartz/dartz.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/no_param_use_case.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/repositories/sensor_info_repo.dart';

class GetSoilAnalysisDataUsecase extends UseCase<SoilAnalysisEntity> {
  final SensorInfoRepo sensorInfoRepo;

  GetSoilAnalysisDataUsecase(
    this.sensorInfoRepo,
  );

  @override
  Future<Either<FailureModel, SoilAnalysisEntity>> call() async {
    return await sensorInfoRepo.getSoilAnalysisData();
  }
}
