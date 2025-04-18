import 'dart:developer';

import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/forgot_password_dialog_cubit/forgot_password_dialog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordDialogCubit extends Cubit<ForgotPasswordDialogState> {
  ForgotPasswordDialogCubit() : super(InitialState());
  final api = getIt.get<DioConsumer>();

  //! reset password with sending OTP code to email
  Future<void> forgotUsernameOrPasswordUsingOTP() async {
    emit(LoadingState());
    try {
      final response =
          await api.post(EndPoints.forgotUsernameOrPasswordUsingOTP, data: {
        ApiKeys.email: getIt<CacheHelper>().getData(key: ApiKeys.email),
      });
      log(response.toString());
      emit(SuccessState());
      log('Success');
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(ErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }
}
