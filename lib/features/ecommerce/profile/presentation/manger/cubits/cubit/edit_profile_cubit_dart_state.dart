class EditProfileState {}

class EditProfileInitialState extends EditProfileState {}

class ImagePickedSuccessState extends EditProfileState {}

class ImagePickedErrorState extends EditProfileState {
  final String errorMessage;

  ImagePickedErrorState({required this.errorMessage});
}

class ImagePickedLoadingState extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileSuccessState extends EditProfileState {}

class EditProfileErrorState extends EditProfileState {
  final String errorMessage;

  EditProfileErrorState({required this.errorMessage});
}