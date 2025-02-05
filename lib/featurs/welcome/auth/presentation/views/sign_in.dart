import 'package:crop_pilot/featurs/welcome/auth/presentation/views/forgot_password.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(
              height: 100,
            ),
            const Text('Let\'s Get \nYou Sign In !',
                textAlign: TextAlign.left,
                style: AppTextStyles.textStyle32),
            SizedBox(
              height: 55,
            ),

            CustomTextFormField(
              obsscureText: false,
              Name: 'Email',
              Iconname: Icons.mail,
            ),
            SizedBox(
              height: 15,
            ),
            CustomPasswordTextFormField(),
            SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ForgotPassword();

                    },
                    ),
                    );
                  },
                  child: Text('Forgot Password',
                    textAlign: TextAlign.right,
                    style:TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline
                    ),
                  ),
                )

              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              buttoncolor: AppColors.primary,
              buttonheight: 60,
              buttonwidth: double.infinity,
              buttontext: 'Sign In',
              textcolor: Colors.white,

            ) ,

            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness:1,
                    color: Colors.grey,
                  ),
                ),
                Text('Or'),
                Expanded(
                  child: Divider(
                    thickness: 1 ,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                  },
                  borderRadius: BorderRadius.circular(8),
                  splashColor: AppColors.gray,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 50,),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                  },
                  borderRadius: BorderRadius.circular(8),
                  splashColor: AppColors.gray,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(FontAwesomeIcons.google,
                      color: Colors.blue,
                      size: 50,),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t Have An Acount ?'),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CreateAccount();

                    },
                    ),
                    );
                  },
                  child: Text('Sign Up',
                    style:TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 15,
            ),



          ],
        ),

      ),
    );
  }
}
