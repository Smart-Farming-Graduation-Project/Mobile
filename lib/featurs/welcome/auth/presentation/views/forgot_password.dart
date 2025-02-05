import 'package:crop_pilot/featurs/welcome/auth/presentation/views/verification_code.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,

          children: [
            Spacer(
              flex: 16,
            ),

            const Text('Forgot Your \nPassword !',
                textAlign: TextAlign.left,
                style: AppTextStyles.textStyle32),
            Spacer(
              flex: 1,
            ),


            CustomTextFormField(
              obsscureText: false,
              Name: 'Email',
              Iconname: Icons.mail,
            ),
            Spacer(
              flex: 1,
            ),



            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return VerificationCode();

                },
                ),
                );
              },
              child: CustomButton(
                buttoncolor: AppColors.primary,
                buttonheight: 60,
                buttonwidth: double.infinity,
                buttontext: 'Send',
                textcolor: Colors.white,

              ),
            ) ,
            Spacer(
              flex: 32,
            ),



          ],
        ),

      ),
    );
  }
}
