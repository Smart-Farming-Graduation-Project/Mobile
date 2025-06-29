import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/features/farmer/soil_info/data/datasources/soil_info_remote_datasource.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_chart_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/repositories/sensor_info_repo.dart';
import 'package:dartz/dartz.dart';

class SensorInfoRepoImpl implements SensorInfoRepo {
  final SoilInfoRemoteDataSource remoteDataSource;

  SensorInfoRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<FailureModel, SoilAnalysisEntity>> getSoilAnalysisData() async {
    try {
      final soilAnalysis = await remoteDataSource.getSoilAnalysis();
      return Right(soilAnalysis);
    } on ServerException catch (e) {
      return Left(FailureModel(message: e.errorModel.errorMessage));
    } on NetworkException catch (e) {
      return Left(FailureModel(message: e.message));
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureModel, List<SoilChartEntity>>> getSoilChartData() async {
    try {
      final soilChart = await remoteDataSource.getChartData();
      return Right(soilChart);
    } on ServerException catch (e) {
      return Left(FailureModel(message: e.errorModel.errorMessage));
    } on NetworkException catch (e) {
      return Left(FailureModel(message: e.message));
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }
}
