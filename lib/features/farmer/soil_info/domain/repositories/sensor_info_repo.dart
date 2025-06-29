import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/soil_chart_entity.dart';

abstract class SensorInfoRepo {
  Future<Either<FailureModel, List<SoilChartEntity>>> getSoilChartData();
  Future<Either<FailureModel, SoilAnalysisEntity>> getSoilAnalysisData();
}