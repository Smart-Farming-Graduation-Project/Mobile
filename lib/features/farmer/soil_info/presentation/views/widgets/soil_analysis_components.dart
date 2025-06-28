import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/sensor_data_card.dart';
import 'package:flutter/material.dart';

class SoilAnalysisComponents extends StatelessWidget {
  const SoilAnalysisComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SensorDataCard(
          title: 'Moisture',
          value: '50',
          unit: '%',
          isOk: true,
          safeRange: '30-60',
        ),
        SensorDataCard(
          title: 'Humidity',
          value: '64.7',
          unit: '%',
          safeRange: '40-70',
          isOk: true,
        ),
        SensorDataCard(
          title: 'Temperature',
          value: '25.5',
          unit: '°C',
          safeRange: '20-30',
          isOk: true,
        ),
        SensorDataCard(
          title: 'Light Intensity',
          value: '100',
          unit: 'lux',
          safeRange: '50-200',
          isOk: true,
        ),
        SensorDataCard(
          title: 'Flame',
          value: 'No Flame',
          unit: '',
          isOk: true,
        ),
      ],
    );
  }
}
