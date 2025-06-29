class SoilAnalysisEntity {
  // Moisture
  final double moistureValue;
  final bool moistureStatus;

  // Humidity
  final double humidityValue;
  final bool humidityStatus;

  // Temperature
  final double temperatureValue;
  final bool temperatureStatus;

  // Light Intensity
  final double lightIntensityValue;
  final bool lightIntensityStatus;

  // Flame
  final String flameValue;
  final bool flameStatus;

  SoilAnalysisEntity({
    required this.moistureValue,
    required this.moistureStatus,
    required this.humidityValue,
    required this.humidityStatus,
    required this.temperatureValue,
    required this.temperatureStatus,
    required this.lightIntensityValue,
    required this.lightIntensityStatus,
    required this.flameValue,
    required this.flameStatus,
  });
}
