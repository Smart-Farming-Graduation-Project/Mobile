import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/profile_state.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  final api = getIt<DioConsumer>();
  final userId = getIt<CacheHelper>().getDataString(key: ApiKeys.userId);

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final response = await api.get(EndPoints.getProfile(userId!));
      final profile = ProfileModel.fromJson(response[ApiKeys.data]);
      emit(ProfileSuccessState(profile: profile));
    } on ServerException catch (e) {
      emit(ProfileErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }
}
