import 'package:crop_guard/core/api/api_consumer.dart';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/features/farmer/soil_info/data/models/sensor__analysis_model.dart';
import 'package:crop_guard/features/farmer/soil_info/data/models/sensor_data_model.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_chart_entity.dart';

abstract class SoilInfoRemoteDataSource {
  Future<List<SoilChartEntity>> getChartData();
  Future<SoilAnalysisEntity> getSoilAnalysis();
}

class SoilInfoRemoteDataSourceImpl implements SoilInfoRemoteDataSource {
  final ApiConsumer api;

  SoilInfoRemoteDataSourceImpl({required this.api});
  @override
  Future<List<SoilChartEntity>> getChartData() async {
    final response = await api.get(EndPoints.soilChartData);
    final data = response[ApiKeys.data];
    final List<SensorDataModel> models =
        data.map((e) => SensorDataModel.fromJson(e)).toList();
    List<SoilChartEntity> soilChartEntities = [];
    for (int i = 0; i < models.length; i++) {
      final soilChartEntity = SoilChartEntity(
        day: dayName(i),
        healthPercentage: calculateHealthPercentage(models[i]),
      );
      soilChartEntities.add(soilChartEntity);
      if (i == 6) break;
    }
    return soilChartEntities;
  }

  @override
  Future<SoilAnalysisEntity> getSoilAnalysis() async {
    final response = await api.get(EndPoints.soilAnalysisData);
    final data = response[ApiKeys.data];
    final soilAnalysisEntity = SensorAnalysisModel.fromJson(data);
    return soilAnalysisEntity;
  }

  String dayName(int i) {
    final date = DateTime.now().subtract(Duration(days: i));
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[date.weekday - 1]; // weekday is from 1 (Mon) to 7 (Sun)
  }

  double normalize(double value, double min, double max) {
    if (max == min) return 0;
    return ((value - min) / (max - min)).clamp(0, 1);
  }

  double calculateHealthPercentage(SensorDataModel data) {
    final tempScore = normalize(data.soilTemperature, 20, 30);
    final humidityScore = normalize(data.soilMoisture, 30, 60);
    final soilScore = normalize(data.soilMoisture, 30, 60);
    final lightScore = normalize(data.soilMoisture, 50, 200);
    final flameScore = data.isFlame == 0 ? 1.0 : 0.0;
    final totalScore =
        tempScore + humidityScore + soilScore + lightScore + flameScore;
    return (totalScore / 5) * 100;
  }
}
