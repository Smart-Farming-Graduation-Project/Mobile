import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/widgets/button_decoration.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key, required this.onTap, required this.text,
  });

  final void Function() onTap;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ButtonDecoration(
        buttoncolor: AppColors.kPrimaryColor,
        buttonheight: 60,
        buttonwidth: double.infinity,
        buttontext: text,
        textcolor: Colors.white,
      ),
    );
  }
}
