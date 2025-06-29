import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/use_cases/no_param_use_case.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_chart_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/repositories/sensor_info_repo.dart';
import 'package:dartz/dartz.dart';

class GetSoilChartDataUsecase extends UseCase<List<SoilChartEntity>> {
  final SensorInfoRepo sensorInfoRepo;

  GetSoilChartDataUsecase(this.sensorInfoRepo);

  @override
  Future<Either<FailureModel, List<SoilChartEntity>>> call() async {
    return await sensorInfoRepo.getSoilChartData();
  }
}
