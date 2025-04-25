import 'dart:developer';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/helper/show_forgot_password_dialog.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());
  final api = getIt<DioConsumer>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //! basic signIn method {deal with email and password and send to api}
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LoadingState());
        final response = await api.post(EndPoints.login, data: {
          ApiKeys.usernameOrEmail: emailController.text,
          ApiKeys.password: passwordController.text,
        });
        log(response.toString());
        log(response[ApiKeys.data][ApiKeys.tokens][ApiKeys.accessToken]);
        getIt<CacheHelper>().saveData(
            key: ApiKeys.accessToken,
            value: response[ApiKeys.data][ApiKeys.tokens][ApiKeys.accessToken]);
        getIt<CacheHelper>().saveData(
            key: ApiKeys.refreshToken,
            value: response[ApiKeys.data][ApiKeys.tokens]
                [ApiKeys.refreshToken]);
        emit(SuccessState());
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        emit(ErrorState(errorMessage: e.errorModel.errorMessage));
      }
    }
  }

  //! signIn with Google and get needed data to send to method {signInWithThirdParty} which deal with api
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        
          await signInWithThirdParty(
              accessToken: googleAuth.accessToken!,
              provider: 'google',
              );
        
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //! signIn with Facebook and get needed data to send to method {signInWithThirdParty} which deal with api
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final String accessToken = result.accessToken!.tokenString;
          await signInWithThirdParty(
              accessToken: accessToken, provider: 'facebook', );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //! signIn with ThirdParty deal with api
  Future<void> signInWithThirdParty(
      {required String accessToken,
      required String provider,
      }) async {
    try {
      emit(LoadingState());
      final response = await api.post(EndPoints.loginWithThirdParty,
          data: {ApiKeys.accessToken: accessToken, ApiKeys.provider: provider});
      log(response.toString());
      emit(SuccessState());
      
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(ErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }

  //! forget password Alert that show message to user contain email
  void forgetPasswordAlert(BuildContext context) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      getIt<CacheHelper>()
          .saveData(key: ApiKeys.email, value: emailController.text);
      showForgotPasswordDialog(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address.'),
          backgroundColor: AppColors.kDangerColor,
        ),
      );
    }
  }
}
