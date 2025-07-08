import 'dart:developer';

import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_cubit.dart';
import 'package:crop_guard/features/welcome/auth/manger/cubits/register_cubit/register_state.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/first_sign_up_view.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/second_sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSignUp extends StatelessWidget {
  const MainSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          log(state.toString());
          if (state is FirstSignUpState ||
              state is FirstSignUpErrorState ||
              state is FirstSignUpLoadingState) {
            return const FirstSignUpView();
          } else if (state is SecondSignUpState ||
              state is SecondSignUpErrorState ||
              state is SecondSignUpLoadingState ||
              state is PickUserImageState) {
            return const SecondSignUpView();
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
