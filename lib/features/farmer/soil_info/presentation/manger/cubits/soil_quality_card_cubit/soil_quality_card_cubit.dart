import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_chart_entity.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/usecases/get_soil_chart_data_usecase.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_quality_card_cubit/soil_quality_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoilQualityCardCubit extends Cubit<SoilQualityCardState> {
  SoilQualityCardCubit({required this.getSoilChartDataUsecase})
      : super(SoilQualityCardInitial());
  final GetSoilChartDataUsecase getSoilChartDataUsecase;

  Future<void> getSoilChartData() async {
    emit(SoilQualityCardLoading());
    final result = await getSoilChartDataUsecase.call();
    result.fold(
      (failure) => emit(SoilQualityCardError(message: failure.message)),
      (soilChart) {
        final status = getSoilStatus(soilChart);
        emit(SoilQualityCardLoaded(soilChart: soilChart, status: status));
      },
    );
  }

  getSoilStatus(List<SoilChartEntity> soilChart) {
    double healthSum = 0.0;
    for (var element in soilChart) {
      healthSum += element.healthPercentage;
    }
    final averageHealth = healthSum / soilChart.length;
    if (averageHealth >= 80) {
      return 'Good';
    } else if (averageHealth >= 60) {
      return 'Moderate';
    } else {
      return 'Poor';
    }
  }
}
