import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
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
    return const Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Padding(
        padding: EdgeInsets.all(30.0),
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

            Text('We\'ve send the Verification Code on\n email ',
                textAlign: TextAlign.start,
                style:TextStyle(
                    color: Colors.grey,

                ), ),

            Pinput(
              length: 4,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,



            ),


            Row(
              children: [
                Text('Send A New Code',
                  style:TextStyle(
                      color: AppColors.kPrimaryColor,
                  ),
                )

              ],
            ),



            CustomButton(
              buttoncolor: AppColors.kPrimaryColor,
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
