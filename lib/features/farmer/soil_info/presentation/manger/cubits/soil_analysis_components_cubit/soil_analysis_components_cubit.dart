import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'soil_analysis_components_state.dart';

class SoilAnalysisComponentsCubit extends Cubit<SoilAnalysisComponentsState> {
  SoilAnalysisComponentsCubit() : super(SoilAnalysisComponentsInitial());
}
