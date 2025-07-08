import 'dart:developer';
import 'dart:io';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/pick_image.dart';
import 'package:crop_guard/core/helper/upload_image_to_api.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/edit_profile_cubit_dart_state.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitialState());

  final api = getIt<DioConsumer>();
  final userId = getIt<CacheHelper>().getDataString(key: ApiKeys.userId);
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  File? imageFile;

  // Initialize controller values
  void initializeControllers() {
    firstNameController.text =
        getIt<CacheHelper>().getDataString(key: ApiKeys.firstName) ?? '';
    lastNameController.text =
        getIt<CacheHelper>().getDataString(key: ApiKeys.lastName) ?? '';
    phoneController.text =
        getIt<CacheHelper>().getDataString(key: ApiKeys.profilePhone) ?? '';
    addressController.text =
        getIt<CacheHelper>().getDataString(key: ApiKeys.address) ?? '';
    log(firstNameController.text);
    log(lastNameController.text);
    log(phoneController.text);
    log(addressController.text);
  }

  Future<void> updateProfile() async {
    emit(EditProfileLoadingState());
    try {
      if (formKey.currentState!.validate()) {
        if (imageFile != null) {
          await uploadImage();
        }
        if (hasChanges()) {
          await updateUserData();
        }
        emit(EditProfileSuccessState());
        getUserData();
      }
    } on ServerException catch (e) {
      emit(EditProfileErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }

  Future<void> getImage() async {
    imageFile = await pickImage();
    if (imageFile != null) {
      emit(ImagePickedSuccessState());
    } else {
      emit(ImagePickedErrorState(errorMessage: 'Image not picked'));
    }
  }

  Future<void> uploadImage() async {
    final image = await uploadImageToApi(XFile(imageFile!.path));
    final response = await api.post(
      EndPoints.changeProfileImage,
      data: {
        'Image': image,
      },
      isFormData: true,
    );
    log(response.toString());
  }

  Future<void> updateUserData() async {
    final response = await api.put(EndPoints.updateUserData, data: {
      'id': userId,
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'userName': getIt<CacheHelper>().getDataString(key: ApiKeys.username),
      'phone': phoneController.text,
      'address': addressController.text,
    });
    log(response.toString());
  }

  Future<void> getUserData() async {
    final response = await api.get(EndPoints.getProfile(userId!));
    final profile = ProfileModel.fromJson(response[ApiKeys.data]);
    getIt<CacheHelper>()
        .saveData(key: ApiKeys.firstName, value: profile.firstName);
    getIt<CacheHelper>()
        .saveData(key: ApiKeys.lastName, value: profile.lastName);
    getIt<CacheHelper>()
        .saveData(key: ApiKeys.username, value: profile.username);
    getIt<CacheHelper>().saveData(key: ApiKeys.email, value: profile.email);
    getIt<CacheHelper>()
        .saveData(key: ApiKeys.profilePhone, value: profile.phone);
    getIt<CacheHelper>().saveData(key: ApiKeys.address, value: profile.address);
    getIt<CacheHelper>()
        .saveData(key: ApiKeys.profileImage, value: profile.profileImage);
  }

  bool hasChanges() {
    return firstNameController.text !=
            getIt<CacheHelper>().getDataString(key: ApiKeys.firstName) ||
        lastNameController.text !=
            getIt<CacheHelper>().getDataString(key: ApiKeys.lastName) ||
        phoneController.text !=
            getIt<CacheHelper>().getDataString(key: ApiKeys.profilePhone) ||
        addressController.text !=
            getIt<CacheHelper>().getDataString(key: ApiKeys.address);
  }
}
