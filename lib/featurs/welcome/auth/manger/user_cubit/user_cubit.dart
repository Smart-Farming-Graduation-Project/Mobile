import 'dart:developer';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/routing/app_router.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/user_cubit/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserCubit extends Cubit<LoguinState> {
  UserCubit(this.api) : super(InitialState());
  final DioConsumer api;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signIn(BuildContext context) async {
    // this is temporary
    // ignore: use_build_context_synchronously
    GoRouter.of(context).go(AppRouter.home);
    if (formKey.currentState!.validate()) {
      try {
        emit(LoadingState());
        final response = await api.post(EndPoints.login, data: {
          ApiKeys.usernameOrEmail: emailController.text,
          ApiKeys.password: passwordController.text
          // ApiKeys.email: 'mo.zonkol@gmail.com',
          // ApiKeys.password: 'Mo@123456'
        });
        log(response.toString());
        emit(SuccessState());
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go(AppRouter.home);
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        emit(ErrorState(errorMessage: e.errorModel.errorMessage));
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        await signInWithThirdParty(
            accessToken: googleAuth.accessToken!, provider: 'google');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final String accessToken = result.accessToken!.tokenString;
        await signInWithThirdParty(
            accessToken: accessToken, provider: 'facebook');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LoadingState());
        final response = await api.post(EndPoints.register, data: {
          ApiKeys.username: usernameController.text,
          ApiKeys.email: emailController.text,
          ApiKeys.password: passwordController.text,
          ApiKeys.confirmPassword: confirmPasswordController.text
        });
        log(response.toString());
        emit(SuccessState());
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        emit(ErrorState(errorMessage: e.errorModel.errorMessage));
      }
    }
  }

  Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String accessToken = googleAuth.accessToken!;
        final String firstName = googleUser.displayName?.split(' ').first ?? '';
        final String lastName = googleUser.displayName?.split(' ').last ?? '';
        log(firstName);
        log(lastName);
        log(accessToken);
        await signUpWithThirdParty(
            firstName: firstName,
            lastName: lastName,
            accessToken: accessToken,
            provider: 'google');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signUpWithFacebook() async {
    log('signUpWithFacebook');
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      log(result.toString());
      if (result.status == LoginStatus.success) {
        final String accessToken = result.accessToken!.tokenString;

        final userData = await FacebookAuth.instance.getUserData();
        final String firstName = userData['first_name'] ?? '';
        final String lastName = userData['last_name'] ?? '';
        log(firstName);
        log(lastName);
        log(accessToken);
        await signUpWithThirdParty(
            firstName: firstName,
            lastName: lastName,
            accessToken: accessToken,
            provider: 'facebook');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signInWithThirdParty(
      {required String accessToken, required String provider}) async {
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

  Future<void> signUpWithThirdParty(
      {required String firstName,
      required String lastName,
      required String accessToken,
      required String provider}) async {
    try {
      emit(LoadingState());
      final response = await api.post(EndPoints.registerWithThirdParty, data: {
        ApiKeys.firstName: firstName,
        ApiKeys.lastName: lastName,
        ApiKeys.accessToken: accessToken,
        ApiKeys.provider: provider
      });
      log(response.toString());
      emit(SuccessState());
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(ErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }
}
