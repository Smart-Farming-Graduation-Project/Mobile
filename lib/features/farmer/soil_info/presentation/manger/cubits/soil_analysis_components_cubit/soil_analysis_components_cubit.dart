import 'package:crop_guard/features/farmer/soil_info/domain/usecases/get_soil_analysis_data_usecase.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_analysis_components_cubit/soil_analysis_components_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoilAnalysisComponentsCubit extends Cubit<SoilAnalysisComponentsState> {
  SoilAnalysisComponentsCubit({required this.getSoilAnalysisDataUsecase})
      : super(SoilAnalysisComponentsInitial());
  final GetSoilAnalysisDataUsecase getSoilAnalysisDataUsecase;

  Future<void> getSoilAnalysisData() async {
    emit(SoilAnalysisComponentsLoading());
    final result = await getSoilAnalysisDataUsecase.call();
    result.fold(
        (failure) =>
            emit(SoilAnalysisComponentsError(message: failure.message)),
        (soilAnalysisEntity) => emit(SoilAnalysisComponentsLoaded(
            soilAnalysisEntity: soilAnalysisEntity)));
  }
}
