import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/farmer/soil_info/data/repositories/sensor_info_repo_impl.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/usecases/get_soil_analysis_data_usecase.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/usecases/get_soil_chart_data_usecase.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_analysis_components_cubit/soil_analysis_components_cubit.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_analysis_components_cubit/soil_analysis_components_state.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_quality_card_cubit/soil_quality_card_cubit.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/manger/cubits/soil_quality_card_cubit/soil_quality_card_state.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_analysis_components.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_analysis_loading.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_quality_card.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/widgets/soil_quality_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoilInfoLoadedViewBody extends StatelessWidget {
  const SoilInfoLoadedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) => SoilQualityCardCubit(
                  getSoilChartDataUsecase:
                      GetSoilChartDataUsecase(getIt<SensorInfoRepoImpl>()))
                ..getSoilChartData(),
              child: BlocBuilder<SoilQualityCardCubit, SoilQualityCardState>(
                builder: (context, state) {
                  if (state is SoilQualityCardLoaded) {
                    return SoilQualityCard(
                      soilChart: state.soilChart,
                      status: state.status,
                    );
                  } else if (state is SoilQualityCardLoading) {
                    return const SoilQualityLoading();
                  } else if (state is SoilQualityCardError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            BlocProvider(
                create: (context) => SoilAnalysisComponentsCubit(
                    getSoilAnalysisDataUsecase:
                        GetSoilAnalysisDataUsecase(getIt<SensorInfoRepoImpl>()))
                  ..getSoilAnalysisData(),
                child: BlocBuilder<SoilAnalysisComponentsCubit,
                    SoilAnalysisComponentsState>(
                  builder: (context, state) {
                    if (state is SoilAnalysisComponentsLoaded) {
                      return SoilAnalysisComponents(
                        soilAnalysisEntity: state.soilAnalysisEntity,
                      );
                    } else if (state is SoilAnalysisComponentsLoading) {
                      return const SoilAnalysisLoading();
                    } else if (state is SoilAnalysisComponentsError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
