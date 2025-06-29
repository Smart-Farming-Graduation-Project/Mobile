import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';

class SensorAnalysisModel extends SoilAnalysisEntity {
  final String deviceId;
  final double soilTemperature;
  final double soilHumidity;
  final double soilMoisture;
  final double soilLightIntensity;
  final int isFlame;

  SensorAnalysisModel({
    required this.deviceId,
    required this.soilTemperature,
    required this.soilHumidity,
    required this.soilMoisture,
    required this.soilLightIntensity,
    required this.isFlame,
  }) : super(
            moistureValue: soilMoisture,
            humidityValue: soilHumidity,
            temperatureValue: soilTemperature,
            lightIntensityValue: soilLightIntensity,
            flameValue: isFlame == 0 ? "No Flame" : "Flame Detected",
            moistureStatus: isSafe(value: soilMoisture, title: "moisture"),
            humidityStatus: isSafe(value: soilHumidity, title: "humidity"),
            temperatureStatus:
                isSafe(value: soilTemperature, title: "temperature"),
            lightIntensityStatus:
                isSafe(value: soilLightIntensity, title: "light intensity"),
            flameStatus: isFlame == 0 ? true : false);

  factory SensorAnalysisModel.fromJson(Map<String, dynamic> json) {
    return SensorAnalysisModel(
      deviceId: json['deviceId'],
      soilTemperature: (json['temperature'] as num).toDouble(),
      soilHumidity: (json['humidity'] as num).toDouble(),
      soilMoisture: (json['soilMoisture'] as num).toDouble(),
      soilLightIntensity: (json['lightIntensity'] as num).toDouble(),
      isFlame: json['flame'],
    );
  }

  static bool isSafe({required double value, required String title}) {
    switch (title.toLowerCase()) {
      case "moisture":
        return value > 30 && value < 60;
      case "humidity":
        return value > 40 && value < 70;
      case "temperature":
        return value > 20 && value < 30;
      case "light intensity":
        return value > 50 && value < 200;
      default:
        return false;
    }
  }
}
