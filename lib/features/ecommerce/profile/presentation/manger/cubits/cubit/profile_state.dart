import 'package:crop_guard/features/ecommerce/profile/presentation/manger/models/profile_model.dart';

sealed class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String errorMessage;
  ProfileErrorState({required this.errorMessage});
}

class ProfileSuccessState extends ProfileState {
  final ProfileModel profile;
  ProfileSuccessState({required this.profile});
}
