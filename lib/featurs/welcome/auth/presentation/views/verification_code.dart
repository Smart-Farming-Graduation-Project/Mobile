import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import 'package:pinput/pinput.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 35,

          children: [
            Spacer(
              flex: 2,
            ),

             Text('Enter Your \nVerification Code !',
                textAlign: TextAlign.start,
                style: AppTextStyles.textStyle32),

            const Text('We\'ve send the Verification Code on\n email ',
                textAlign: TextAlign.start,
                style:TextStyle(
                    color: Colors.grey,

                ), ),

            Pinput(
              length: 4,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,



            ),


            const Row(
              children: [
                Text('Send A New Code',
                  style:TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  ),
                )

              ],
            ),



            CustomButton(
              buttoncolor: AppColors.primary,
              buttonheight: 60,
              buttonwidth: double.infinity,
              buttontext: 'Verify',
              textcolor: Colors.white,

            ) ,
            Spacer(
              flex: 4,
            ),



          ],
        ),

      ),
    );
  }
}
