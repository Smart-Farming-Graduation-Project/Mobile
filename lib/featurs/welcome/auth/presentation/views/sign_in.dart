import 'dart:ui';

import 'package:crop_guard/core/utils/routing/app_router.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import '../../../../../core/utils/theme/assets_data.dart';
import 'create_account.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController textEditingController = TextEditingController();
  String displayText ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(AseetsData.greenlogo2,height: 90,scale: 0.8,),

            const SizedBox(
              height: 35,
            ),
             Text('Welcome Back',
                textAlign: TextAlign.center, style: AppTextStyles.textStyle32.copyWith(fontWeight: FontWeight.bold)),
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
            const CustomPasswordTextFormField(text: 'Password',),
            const SizedBox(
              height: 2,
            ),

             TextButton(onPressed: (){
               _showAlertDialog(context);
             },
                 child: const Align(
                   alignment: Alignment.topRight,
                   child: Text(
                     'Forgot Password ?',
                     style: TextStyle(
                       color: AppColors.kPrimaryColor,),
                   ),
                 ),),
            const SizedBox(
              height: 20,
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
              height: 35,
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
              height: 10,
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
              height: 25,
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
                        color: AppColors.kPrimaryColor,),
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
  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
            child: AlertDialog(
              content: Text("         Verify Your Email Address\n\n\nwe will send the authentication code\n    to the email address you entered.\n                 Do you want continue?\n",
              style: AppTextStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),),
              actions: <Widget>[
                 ElevatedButton(onPressed: (){
                   Navigator.of(context).pop();
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.kPrimaryColor,
                   foregroundColor: AppColors.kWhiteColor,
                   padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 16),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8)
                   )
                 ),
                     child:  const Text('cancel'),),

                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: AppColors.kWhiteColor,
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      )
                  ),
                  child: const Text('Next'),),
              ],
            ),
          );
          },
        );
    }


}
