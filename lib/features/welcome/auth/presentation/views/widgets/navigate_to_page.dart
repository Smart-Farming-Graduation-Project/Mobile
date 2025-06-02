import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigateToPage extends StatelessWidget {
  const NavigateToPage({
    super.key,
    required this.nextPage,
  });
  final String nextPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          nextPage != 'signIn'
              ? 'New to Crop Guard ? '
              : 'Already Have An Acount ? ',
          style: AppTextStyles.font14BlackRegular,
        ),
        GestureDetector(
          onTap: () {
            if (nextPage != 'signIn') {
              GoRouter.of(context).go(AppRouter.signUp);
            } else {
              GoRouter.of(context).go(AppRouter.signIn);
            }
          },
          child: Text(
            nextPage != 'signIn' ? 'Sign Up' : 'Sign In',
            style: AppTextStyles.font16GreenBold,
          ),
        ),
      ],
    );
  }
}
