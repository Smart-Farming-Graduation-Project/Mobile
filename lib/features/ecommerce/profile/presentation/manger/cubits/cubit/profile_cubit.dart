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
      getIt<CacheHelper>().saveData(
          key: ApiKeys.firstName, value: profile.firstName);
      getIt<CacheHelper>().saveData(
          key: ApiKeys.lastName, value: profile.lastName);
      getIt<CacheHelper>().saveData(
          key: ApiKeys.username, value: profile.username);
      getIt<CacheHelper>().saveData(
          key: ApiKeys.email, value: profile.email);
      getIt<CacheHelper>().saveData(
          key: ApiKeys.profilePhone, value: profile.phone);
      getIt<CacheHelper>().saveData(
          key: ApiKeys.address, value: profile.address);
      getIt<CacheHelper>().saveData(
          key: ApiKeys.profileImage, value: profile.profileImage);
      if (!isClosed) emit(ProfileSuccessState(profile: profile));
    } on ServerException catch (e) {
      if (!isClosed) {
        emit(ProfileErrorState(errorMessage: e.errorModel.errorMessage));
      }
    }
  }
}
