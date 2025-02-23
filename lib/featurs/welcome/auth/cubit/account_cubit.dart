import 'package:crop_guard/featurs/welcome/auth/cubit/account_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/theme/app_colors.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(InitialState(personColor: AppColors.kGrayColor, containerColor: Colors.black.withAlpha(15), buttonColor: AppColors.kGrayColor));
  void ChooseBuyer (){
   emit(BuyerState(personColor:AppColors.kWhiteColor,containerColor:AppColors.kPrimaryColor,buttonColor:AppColors.kPrimaryColor));

  }
  void ChooseSeller (){
    emit(SellerState(personColor:AppColors.kWhiteColor, containerColor:AppColors.kPrimaryColor,buttonColor:AppColors.kPrimaryColor));

  }


}