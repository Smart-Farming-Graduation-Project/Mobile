import 'dart:developer';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/decoded_token.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/welcome/auth/manger/helper/show_forgot_password_dialog.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

        DecodedToken().saveDecodedToken(
            response[ApiKeys.data][ApiKeys.tokens][ApiKeys.accessToken]);
        emit(SuccessState(
            role: getIt<CacheHelper>().getDataString(key: ApiKeys.role)!));
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
        final String userId = googleUser.id;
        await signInWithThirdParty(
          userId: userId,
          accessToken: googleAuth.accessToken!,
          provider: 'google',
        );
      }
    } catch (e) {
      GoogleSignIn().signOut();
      log(e.toString());
    }
  }

  //! signIn with Facebook and get needed data to send to method {signInWithThirdParty} which deal with api
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final String accessToken = result.accessToken!.tokenString;
        final userData = await FacebookAuth.instance.getUserData();
        final String userId = userData['id'] ?? '';
        await signInWithThirdParty(
          userId: userId,
          accessToken: accessToken,
          provider: 'facebook',
        );
      }
    } catch (e) {
      FacebookAuth.instance.logOut();
      log(e.toString());
    }
  }

  //! signIn with ThirdParty deal with api
  Future<void> signInWithThirdParty({
    required String accessToken,
    required String provider,
    required String userId,
  }) async {
    try {
      emit(LoadingState());
      final response = await api.post(EndPoints.loginWithThirdParty,
          data: {
            ApiKeys.accessToken: accessToken,
            ApiKeys.provider: provider,
            ApiKeys.userId: userId,
          });
      log(response.toString());
      final decodedToken = JwtDecoder.decode(
          response[ApiKeys.data][ApiKeys.tokens][ApiKeys.accessToken]);
      final rolesList = decodedToken["Role"] as List<dynamic>;
      emit(SuccessState(role: rolesList[0]));
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
