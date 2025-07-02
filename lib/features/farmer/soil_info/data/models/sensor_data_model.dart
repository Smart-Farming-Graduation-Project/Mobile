class SensorDataModel {
  double soilMoisture;
  double soilHumidity;
  double soilTemperature;
  double soilLightIntensity;
  int isFlame;

  SensorDataModel({
    required this.soilMoisture,
    required this.soilHumidity,
    required this.soilTemperature,
    required this.soilLightIntensity,
    required this.isFlame,
  });

  factory SensorDataModel.fromJson(Map<String, dynamic> json) {
    return SensorDataModel(
      soilMoisture: (json['soilMoisture'] as num).toDouble(),
      soilHumidity: (json['humidity'] as num).toDouble(),
      soilTemperature: (json['temperature'] as num).toDouble(),
      soilLightIntensity: (json['lightIntensity'] as num).toDouble(),
      isFlame: json['flame'],
    );
  }
}
