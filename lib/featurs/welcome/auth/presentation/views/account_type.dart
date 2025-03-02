import 'package:crop_guard/core/routing/app_router.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/rule_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/button_decoration.dart';
import '../../manger/cubit/account_cubit.dart';
import '../../manger/cubit/account_cubit_state.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: Scaffold(
        backgroundColor: AppColors.kWhiteColor,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(flex: 13),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Select Your Account Type',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900,),
                ),
              ),
              const Spacer(flex: 2),
              const RoleIcons(),
              const Spacer(flex: 9),
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: (){
                      GoRouter.of(context).go(AppRouter.signIn);
                    },
                      child: ButtonDecoration(
                    buttonwidth: 130,
                    buttontext: 'Next',
                        buttoncolor: state is InitialState? AppColors.kGrayColor: AppColors.kPrimaryColor,
                  ));
                },
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
