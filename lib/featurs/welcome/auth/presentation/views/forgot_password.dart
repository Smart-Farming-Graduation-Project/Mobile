import 'package:crop_guard/featurs/welcome/auth/presentation/views/verification_code.dart';
import 'package:crop_guard/core/widgets/button_decoration.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,
          children: [
            const Spacer(
              flex: 16,
            ),
            const Text('Forgot Your \nPassword !',
                textAlign: TextAlign.left, style: AppTextStyles.textStyle32),
            const Spacer(
              flex: 1,
            ),
            // const CustomTextFormField(
            //   obsscureText: false,
            //   name: 'Email',
            //   iconName: Icons.mail,
            // ),
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const VerificationCode();
                    },
                  ),
                );
              },
              child: const ButtonDecoration(
                buttoncolor: AppColors.kPrimaryColor,
                buttonheight: 60,
                buttonwidth: double.infinity,
                buttontext: 'Send',
                textcolor: Colors.white,
              ),
            ),
            const Spacer(
              flex: 32,
            ),
          ],
        ),
      ),
    );
  }
}
