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
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(FirstSignUpState());
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

  // void selectRole(String selectedRole) {
  //   role = selectedRole;
  //   emit(RegisterRoleSelectedState(role));
  // }

  Future<void> checkEmailAndUsername() async {
    if (formKeyFirstPage.currentState!.validate() &&
        getIt<TermsAndConditionsCubit>().isAccepted) {
      try {
        if (!isClosed) {
          emit(FirstSignUpLoadingState());
        }
        final response = await api.post(EndPoints.checkEmailAndUsername, data: {
          ApiKeys.email: emailController.text,
          ApiKeys.username: usernameController.text,
        });
        log(response.toString());
        if (!isClosed) {
          emit(SecondSignUpState());
        }
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        if (!isClosed) {
          emit(FirstSignUpErrorState(errorMessage: e.errorModel.errorMessage));
        }
      }
    } else if (!getIt<TermsAndConditionsCubit>().isAccepted) {
      if (!isClosed) {
        emit(FirstSignUpErrorState(
            errorMessage: 'Please accept terms and conditions'));
      }
    } else {
      if (!isClosed) {
        emit(FirstSignUpErrorState(errorMessage: 'Please fill all fields'));
      }
    }
  }

  Future<void> signUp() async {
    if (formKeySecondPage.currentState!.validate() && imageFile != null) {
      try {
        if (!isClosed) {
          emit(SecondSignUpLoadingState());
        }
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
        if (!isClosed) {
          emit(RegisterSuccessState());
        }
      } on ServerException catch (e) {
        log(e.errorModel.errorMessage);
        if (!isClosed) {
          emit(SecondSignUpErrorState(errorMessage: e.errorModel.errorMessage));
        }
      }
    } else {
      if (!isClosed) {
        emit(SecondSignUpErrorState(errorMessage: 'Please Select image'));
      }
    }
  }

  //! signUp with Google and get needed data to send to method {signUpWithThirdParty} which deal with api
  Future<void> signUpWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'profile',
        ],
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String accessToken = googleAuth.accessToken!;
        final String userId = googleUser.id;
        final String firstName = googleUser.displayName?.split(' ').first ?? '';
        final String lastName = googleUser.displayName?.split(' ').last ?? '';
        log(firstName);
        log(lastName);
        log(accessToken);
        if (context.mounted) {
          await signUpWithThirdParty(
              firstName: firstName,
              lastName: lastName,
              email: googleUser.email,
              address: 'Zagazig',
              accessToken: accessToken,
              userId: userId,
              provider: 'google',
              profileImage: googleUser.photoUrl ?? '',
              context: context);
        }
      }
    } catch (e) {
      GoogleSignIn().signOut();
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
        final String firstName = userData['name'].split(' ').first;
        final String lastName = userData['name'].split(' ').last;
        log(firstName);
        log(lastName);
        log(accessToken);
        if (context.mounted) {
          await signUpWithThirdParty(
              firstName: firstName,
              lastName: lastName,
              email: userData['email'] ?? '',
              address: 'Zagazig',
              accessToken: accessToken,
              userId: userData['id'] ?? '',
              provider: 'facebook',
              profileImage: userData['picture']?['data']?['url'] ?? '',
              context: context);
        }
      }
    } catch (e) {
      FacebookAuth.instance.logOut();
      log(e.toString());
    }
  }

  //! signUp with ThirdParty deal with api
  Future<void> signUpWithThirdParty(
      {required String firstName,
      required String lastName,
      required String email,
      required String address,
      required String accessToken,
      required String userId,
      required String provider,
      required String profileImage,
      required BuildContext context}) async {
    try {
      if (!isClosed) {
        emit(FirstSignUpLoadingState());
      }
      final response = await api.post(EndPoints.registerWithThirdParty, data: {
        ApiKeys.firstName: firstName,
        ApiKeys.lastName: lastName,
        ApiKeys.accessToken: accessToken,
        ApiKeys.provider: provider,
        ApiKeys.userId: userId,
        ApiKeys.email: email,
        ApiKeys.address: address,
        ApiKeys.profileImage: profileImage,
      });
      log(response.toString());
      if (context.mounted) {
        GoRouter.of(context).go(AppRouter.home);
      }
    } on ServerException catch (e) {
      log(e.errorModel.errorMessage);
      if (!isClosed) {
        log("errorMessage: ${e.errorModel.errorMessage}");
        emit(FirstSignUpErrorState(errorMessage: e.errorModel.errorMessage));
      }
    }
  }

  // void chooseBuyer() {
  //   selectRole('Buyer');
  // }

  // void chooseFarmer() {
  //   selectRole('Farmer');
  // }

  void pickUserImage() async {
    imageFile = await pickImage();
    if (imageFile != null && !isClosed) {
      emit(PickUserImageState(imageFile: imageFile!));
    }
  }
}
