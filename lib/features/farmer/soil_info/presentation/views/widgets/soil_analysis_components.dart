import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/sensor_data_card.dart';
import 'package:flutter/material.dart';

class SoilAnalysisComponents extends StatelessWidget {
  const SoilAnalysisComponents({super.key, required this.soilAnalysisEntity});
  final SoilAnalysisEntity soilAnalysisEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SensorDataCard(
          title: 'Moisture',
          value: soilAnalysisEntity.moistureValue.toStringAsFixed(2),
          unit: '%',
          isOk: soilAnalysisEntity.moistureStatus,
          safeRange: '30-60',
        ),
        SensorDataCard(
          title: 'Humidity',
          value: soilAnalysisEntity.humidityValue.toStringAsFixed(2),
          unit: '%',
          safeRange: '40-70',
          isOk: soilAnalysisEntity.humidityStatus,
        ),
        SensorDataCard(
          title: 'Temperature',
          value: soilAnalysisEntity.temperatureValue.toStringAsFixed(2),
          unit: '°C',
          safeRange: '20-30',
          isOk: soilAnalysisEntity.temperatureStatus,
        ),
        SensorDataCard(
          title: 'Light Intensity',
          value: soilAnalysisEntity.lightIntensityValue.toStringAsFixed(2),
          unit: 'lux',
          safeRange: '50-200',
          isOk: soilAnalysisEntity.lightIntensityStatus,
        ),
        SensorDataCard(
          title: 'Flame',
          value: soilAnalysisEntity.flameValue,
          isOk: soilAnalysisEntity.flameStatus,
        ),
      ],
    );
  }
}
