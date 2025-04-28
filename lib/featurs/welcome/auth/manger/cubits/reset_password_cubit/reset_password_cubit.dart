import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/reset_password_cubit/reset_password_satate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordSatate> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final api = getIt.get<DioConsumer>();

  //! reset password
  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoading());
      try {
        final response = await api.put(EndPoints.resetPassword, data: {
          ApiKeys.token: getIt<CacheHelper>().getData(key: ApiKeys.token),
          ApiKeys.email: getIt<CacheHelper>().getData(key: ApiKeys.email),
          ApiKeys.newPassword: newPasswordController.text,
          ApiKeys.confirmPassword: confirmPasswordController.text,
        });
        log(response.toString());
        emit(ResetPasswordSuccess());
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        emit(ResetPasswordError(errorMessage: e.errorModel.errorMessage));
      }
    }
  }
}
