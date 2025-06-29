import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_analysis_components_cubit/soil_analysis_components_cubit.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_analysis_components_cubit/soil_analysis_components_state.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/sensor_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoilAnalysisComponents extends StatelessWidget {
  const SoilAnalysisComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoilAnalysisComponentsCubit,
        SoilAnalysisComponentsState>(
      builder: (context, state) {
        if (state is SoilAnalysisComponentsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SensorDataCard(
                title: 'Moisture',
                value: state.soilAnalysisEntity.moistureValue.toString(),
                unit: '%',
                isOk: state.soilAnalysisEntity.moistureStatus,
                safeRange: '30-60',
              ),
              SensorDataCard(
                title: 'Humidity',
                value: state.soilAnalysisEntity.humidityValue.toString(),
                unit: '%',
                safeRange: '40-70',
                isOk: state.soilAnalysisEntity.humidityStatus,
              ),
              SensorDataCard(
                title: 'Temperature',
                value: state.soilAnalysisEntity.temperatureValue.toString(),
                unit: '°C',
                safeRange: '20-30',
                isOk: state.soilAnalysisEntity.temperatureStatus,
              ),
              SensorDataCard(
                title: 'Light Intensity',
                value: state.soilAnalysisEntity.lightIntensityValue.toString(),
                unit: 'lux',
                safeRange: '50-200',
                isOk: state.soilAnalysisEntity.lightIntensityStatus,
              ),
              SensorDataCard(
                title: 'Flame',
                value: state.soilAnalysisEntity.flameValue,
                isOk: state.soilAnalysisEntity.flameStatus,
              ),
            ],
          );
        } else if (state is SoilAnalysisComponentsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SoilAnalysisComponentsError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
