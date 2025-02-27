import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/facebook_icon.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/google_icon.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        FacebookIcon(onPressed: () {}),
        GoogleIcon(onPressed: () {})
      ],
    );
  }
}
