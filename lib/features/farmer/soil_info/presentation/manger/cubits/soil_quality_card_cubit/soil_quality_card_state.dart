import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_chart_entity.dart';

class SoilQualityCardState {}

class SoilQualityCardInitial extends SoilQualityCardState {}

class SoilQualityCardLoading extends SoilQualityCardState {}

class SoilQualityCardLoaded extends SoilQualityCardState {
  final List<SoilChartEntity> soilChart;
  final String status;

  SoilQualityCardLoaded({required this.soilChart, required this.status,});
}

class SoilQualityCardError extends SoilQualityCardState {
  final String message;

  SoilQualityCardError({required this.message});
}