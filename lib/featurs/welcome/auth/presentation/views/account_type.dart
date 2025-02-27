import 'package:crop_guard/featurs/welcome/auth/manger/cubit/account_cubit.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/rule_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../manger/cubit/account_cubit_state.dart';
import 'sign_up_view.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  bool onTap = false;
  Color containerColor = AppColors.kWhiteColor;
  Color personColor = AppColors.kGrayColor;
  Color buttonColor =  AppColors.kGrayColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocProvider<AccountCubit>(create:(context)=> AccountCubit( ),
     child:
        Column(
          children: [
            const Spacer(
              flex: 11,
            ),
            const Text('Select Your Account Type',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 25,
                )),
            const Spacer(
              flex: 1,
            ),
            const RuleIcon(),
            const Spacer(
              flex: 8,
            ),
            BlocBuilder<AccountCubit, AccountState>(builder:(context, state){
              {
                context.read<AccountCubit>();
              }

            return  ElevatedButton(
                onPressed:
                    (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context)=>const SignUpView(
                      )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    minimumSize: const Size(200, 70),
                ),
                child: Text('Next',style: AppTextStyles.textStyle24.copyWith(
                  color: AppColors.kWhiteColor
                )
                ),
              ) ;
            }
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    ));
  }
}