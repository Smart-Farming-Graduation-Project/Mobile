
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/home/manger/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final api = getIt<DioConsumer>();
  void changePage(int index) => emit(HomeLoaded(index));
 Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      emit(HomeLoaded(0));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
