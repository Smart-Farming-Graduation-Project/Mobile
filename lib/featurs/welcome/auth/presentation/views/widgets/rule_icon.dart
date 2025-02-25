import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/icon_buyer.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/icon_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/theme/app_colors.dart';
import '../../../cubit/account_cubit.dart';
import '../../../cubit/account_cubit_state.dart';

class RuleIcon extends StatefulWidget {
  const RuleIcon({super.key,});


  @override
  State<RuleIcon> createState() => _RuleIconState();
}

class _RuleIconState extends State<RuleIcon> {
  bool onTap= false;
  Color containerColor1 = AppColors.kWhiteColor;
  Color personColor1 =  AppColors.kGrayColor;
  Color containerColor2 = AppColors.kWhiteColor;
  Color personColor2 =  AppColors.kGrayColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<AccountCubit, AccountState>(builder:(context, state){

      return  GestureDetector(
          onTap: (){
            context.read<AccountCubit>().ChooseBuyer();

          },


          child: const IconBuyer(),
        )
    ;
    }),
        BlocBuilder<AccountCubit, AccountState>(builder:(context, state){

    return GestureDetector(
    onTap: (){
    context.read<AccountCubit>().ChooseSeller();

    },
    child:const IconSeller(),
    );
    }
        )],
    );

  }
}


