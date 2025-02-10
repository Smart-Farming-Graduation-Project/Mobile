import 'package:crop_guard/core/utils/routing/app_router.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/forgot_password.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import 'create_account.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text('Let\'s Get \nYou Sign In !',
                textAlign: TextAlign.left, style: AppTextStyles.textStyle32),
            const SizedBox(
              height: 55,
            ),
            const CustomTextFormField(
              obsscureText: false,
              name: 'Email',
              iconName: Icons.mail,
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomPasswordTextFormField(),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ForgotPassword();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go(AppRouter.home);
              },
              child: const CustomButton(
                buttoncolor: AppColors.kPrimaryColor,
                buttonheight: 60,
                buttonwidth: double.infinity,
                buttontext: 'Sign In',
                textcolor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Text('Or'),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  splashColor: AppColors.kGrayColor,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  splashColor: AppColors.kGrayColor,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.blue,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t Have An Acount ?'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CreateAccount();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
