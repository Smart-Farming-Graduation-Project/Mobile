import 'dart:developer';

import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/routing/app_router.dart';
import 'package:crop_guard/featurs/welcome/auth/manger/user_cubit/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  final bool isTermsAccepted = false;

  Future<void> signIn(BuildContext context) async {
    // this is temporary
    // ignore: use_build_context_synchronously
    GoRouter.of(context).go(AppRouter.home);
    if (formKey.currentState!.validate()) {
      try {
        emit(LoadingState());
        final response = await api.post(EndPoints.login, data: {
          //   ApiKeys.usernameOrEmail: emailController.text,
          //   ApiKeys.password: passwordController.text
          ApiKeys.email: 'mo.zonkol@gmail.com',
          ApiKeys.password: 'Mo@123456'
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
}
