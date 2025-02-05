
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/rule_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import 'create_account.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  bool onTap= false;
  Color containerColor = AppColors.white;
  Color personColor =  AppColors.gray;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(

          children: [
            const Spacer(
              flex: 11,
            ),

            const Text('Select Your Account Type',
                textAlign: TextAlign.start,
                style:TextStyle(
                  fontSize: 25,


                )
                ),
            const Spacer(
              flex: 1,
            ),

            const RuleIcon(),

            const Spacer(
              flex:8,
            ),



            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return CreateAccount();

                },
                ),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  buttoncolor: AppColors.primary,
                  buttonheight:50,
                  buttonwidth: 130,
                  buttontext: 'Next',
                  textcolor: Colors.white,
                  radius: 10,

                ),
              ),
            ) ,
            Spacer(flex: 1,)



          ],
        ),

      ),
    );
  }
}