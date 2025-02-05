
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/sign_in.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(
              height: 45,
            ),
            const Text('Create \nAn Acount',
                textAlign: TextAlign.left,
                style: AppTextStyles.textStyle32),
            SizedBox(
              height: 45,
            ),
            CustomTextFormField(
              obsscureText: false,
              Name: 'Name',
              Iconname: Icons.person,
            ),
            SizedBox(
              height: 15,
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
            CustomPasswordTextFormField() ,
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Checkbox(value: isChecked, onChanged: (bool? value)
                {
                  setState(() {
                    isChecked= value!;
                  });
                }
                )
                ,
                Text('I agree to the Terms & Conditions'),

              ],
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              buttoncolor: AppColors.primary,
              buttonheight: 60,
              buttonwidth: double.infinity,
              buttontext: 'Sign Up',
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
              height: 15,
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already Have An Acount ?'),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SignIn();

                    },
                    ),
                    );
                  },
                  child: Text('Sign In',
                    style:TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline
                    ),
                  ),
                )
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
