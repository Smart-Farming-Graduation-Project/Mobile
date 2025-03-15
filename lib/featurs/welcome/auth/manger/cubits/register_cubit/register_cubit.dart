import 'dart:developer';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(AccountTypestate());
  final api = getIt<DioConsumer>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKeyFirstPage = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKeySecondPage = GlobalKey<FormState>();
  String role = '';

  void goToFirstSignUpPage() {
    emit(FirstSignUpState());
  }

  void selectRole(String selectedRole) {
    role = selectedRole;
    emit(RegisterRoleSelectedState(role));
  }

  Future<void> checkEmailAndUsername() async {
    if (formKeyFirstPage.currentState!.validate()) {
      try {
        emit(FirstSignUpLoadingState());
        final response = await api.post(EndPoints.checkEmailAndUsername, data: {
          ApiKeys.email: emailController.text,
          ApiKeys.username: usernameController.text,
        });
        log(response.toString());
        emit(SecondSignUpState());
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        emit(FirstSignUpErrorState(errorMessage: e.errorModel.errorMessage));
      }
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (formKeySecondPage.currentState!.validate()) {
      try {
        emit(SecondSignUpLoadingState());
        final response = await api.post(EndPoints.register, data: {
          ApiKeys.firstName: firstNameController.text,
          ApiKeys.lastName: lastNameController.text,
          ApiKeys.username: usernameController.text,
          ApiKeys.email: emailController.text,
          ApiKeys.password: passwordController.text,
          ApiKeys.confirmPassword: confirmPasswordController.text,
          ApiKeys.phoneNumber: phoneController.text,
          // ApiKeys.role: role,
        });
        log(response.toString());
        if (context.mounted) {
          GoRouter.of(context).go(AppRouter.home);
        }
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        emit(SecondSignUpErrorState(errorMessage: e.errorModel.errorMessage));
      }
    }
  }

  //! signUp with Google and get needed data to send to method {signUpWithThirdParty} which deal with api
  Future<void> signUpWithGoogle(BuildContext context) async {
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
        if (context.mounted) {
          GoRouter.of(context).go(AppRouter.home);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //! signUp with Facebook and get needed data to send to method {signUpWithThirdParty} which deal with api
  Future<void> signUpWithFacebook(BuildContext context) async {
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
        if (context.mounted) {
          GoRouter.of(context).go(AppRouter.home);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //! signUp with ThirdParty deal with api
  Future<void> signUpWithThirdParty(
      {required String firstName,
      required String lastName,
      required String accessToken,
      required String provider}) async {
    try {
      emit(FirstSignUpLoadingState());
      final response = await api.post(EndPoints.registerWithThirdParty, data: {
        ApiKeys.firstName: firstName,
        ApiKeys.lastName: lastName,
        ApiKeys.accessToken: accessToken,
        ApiKeys.provider: provider
      });
      log(response.toString());
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      emit(FirstSignUpErrorState(errorMessage: e.errorModel.errorMessage));
    }
  }

  void chooseBuyer() {
    selectRole('Buyer');
  }

  void chooseFarmer() {
    selectRole('Farmer');
  }
}
