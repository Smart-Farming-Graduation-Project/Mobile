import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/otp_cubit/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitialState());
  final api = getIt<DioConsumer>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //! reset password with sending OTP code to email
  Future<void> resetPasswordUsingOTP({required String otpCode}) async {
    log(getIt<CacheHelper>().getData(key: ApiKeys.email));
    try {
      emit(OtpLoadingState());
      final response = await api.post(EndPoints.resetPasswordUsingOTP, data: {
        ApiKeys.email: getIt<CacheHelper>().getData(key: ApiKeys.email),
        ApiKeys.code: otpCode,
      });
      log(response['message']);
      emit(OtpSuccessState());

      getIt<CacheHelper>()
          .saveData(key: ApiKeys.token, value: response['message']);
      log('Success');
    } on ServerException catch (e) {
      emit(OtpErrorState(errorMessage: e.errorModel.errorMessage));
      log(e.errorModel.errorMessage);
    }
  }
}
