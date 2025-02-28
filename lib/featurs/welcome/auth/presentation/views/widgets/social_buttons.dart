import 'package:crop_guard/featurs/welcome/auth/manger/user_cubit/user_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/facebook_icon.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/google_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.isSignInPage,
  });
  final bool isSignInPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FacebookIcon(onPressed: () {
          if (isSignInPage) {
            context.read<UserCubit>().signInWithFacebook();
          } else {
            context.read<UserCubit>().signInWithFacebook();
          }
        }),
        GoogleIcon(onPressed: () {
          if (isSignInPage) {
            context.read<UserCubit>().signInWithGoogle();
          } else {
            context.read<UserCubit>().signUpWithGoogle();
          }
        })
      ],
    );
  }
}
