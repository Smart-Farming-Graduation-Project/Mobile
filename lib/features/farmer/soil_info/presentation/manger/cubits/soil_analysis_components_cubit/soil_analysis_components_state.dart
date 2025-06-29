import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_analysis_entity.dart';

sealed class SoilAnalysisComponentsState {}

class SoilAnalysisComponentsInitial extends SoilAnalysisComponentsState {}

class SoilAnalysisComponentsLoading extends SoilAnalysisComponentsState {}

class SoilAnalysisComponentsLoaded extends SoilAnalysisComponentsState {
  final SoilAnalysisEntity soilAnalysisEntity;

  SoilAnalysisComponentsLoaded({required this.soilAnalysisEntity});
}

class SoilAnalysisComponentsError extends SoilAnalysisComponentsState {
  final String message;

  SoilAnalysisComponentsError({required this.message});
}