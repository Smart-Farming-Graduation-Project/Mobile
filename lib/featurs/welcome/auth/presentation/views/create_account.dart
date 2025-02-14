import 'package:crop_guard/featurs/welcome/auth/presentation/views/sign_in.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_password_text_form_field.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import '../../../../../core/utils/theme/assets_data.dart';

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
              height: 25,
            ),
             Text('Create New Account',
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle32.copyWith(fontWeight: FontWeight.bold)),

            const SizedBox(
              height: 35,
            ),
            const CustomTextFormField(
              obsscureText: false,
              name: 'Name',
              iconName: Icons.person,
            ),
            const SizedBox(
              height: 15,
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
              height: 15,
            ),
             const CustomPasswordTextFormField(text: 'Confirm Password',),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                const Text('I agree to the Terms & Conditions'),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomButton(
              buttoncolor: AppColors.kPrimaryColor,
              buttonheight: 60,
              buttonwidth: double.infinity,
              buttontext: 'Sign Up',
              textcolor: Colors.white,
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
              height: 15,
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
                    child:  const Icon(
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
                      color: AppColors.kGrayColor,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already Have An Acount ?'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignIn();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,),
                  ),
                )
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
