import 'dart:developer';
import 'dart:io';
import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/helper/pick_image.dart';
import 'package:crop_guard/core/helper/upload_image_to_api.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

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
  File? imageFile;
  String role = '';

  void goToFirstSignUpPage() {
    emit(FirstSignUpState());
  }

  void selectRole(String selectedRole) {
    role = selectedRole;
    emit(RegisterRoleSelectedState(role));
  }

  Future<void> checkEmailAndUsername() async {
    if (formKeyFirstPage.currentState!.validate() &&
        getIt<TermsAndConditionsCubit>().isAccepted) {
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
    } else if (!getIt<TermsAndConditionsCubit>().isAccepted) {
      emit(FirstSignUpErrorState(
          errorMessage: 'Please accept terms and conditions'));
    } else {
      emit(FirstSignUpErrorState(errorMessage: 'Please fill all fields'));
    }
  }

  Future<void> signUp() async {
    if (formKeySecondPage.currentState!.validate() && imageFile != null) {
      try {
        emit(SecondSignUpLoadingState());
        final response =
            await api.post(EndPoints.register, isFormData: true, data: {
          "FirstName": firstNameController.text,
          "LastName": lastNameController.text,
          "Username": usernameController.text,
          "Email": emailController.text,
          "Password": passwordController.text,
          "ConfirmPassword": confirmPasswordController.text,
          "Phone": phoneController.text,
          // "Role": role,
          "Image": await uploadImageToApi(XFile(imageFile!.path)),
        });
        log(response.toString());
        emit(RegisterSuccessState());
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        emit(SecondSignUpErrorState(errorMessage: e.errorModel.errorMessage));
      }
    } else {
      emit(SecondSignUpErrorState(errorMessage: 'Please Select image'));
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

  void pickUserImage() async {
    imageFile = await pickImage();
    if (imageFile != null) {
      emit(PickUserImageState(imageFile: imageFile!));
    }
  }
}
