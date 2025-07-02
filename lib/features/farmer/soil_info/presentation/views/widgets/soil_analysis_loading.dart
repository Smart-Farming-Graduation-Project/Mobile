import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_analysis_components.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SoilAnalysisLoading extends StatelessWidget {
  const SoilAnalysisLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SoilAnalysisComponents(
        soilAnalysisEntity: SoilAnalysisEntity(
          moistureValue: 0,
          moistureStatus: false,
          humidityValue: 0,
          humidityStatus: false,
          temperatureValue: 0,
          temperatureStatus: false,
          lightIntensityValue: 0,
          lightIntensityStatus: false,
          flameValue: '',
          flameStatus: false,
        ),
      ),
    );
  }
}
