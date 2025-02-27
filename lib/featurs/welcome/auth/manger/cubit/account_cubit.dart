import 'package:crop_guard/featurs/welcome/auth/manger/cubit/account_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(InitialState(personColor: AppColors.kGrayColor, containerColor: Colors.black.withAlpha(15), buttonColor: AppColors.kGrayColor));
  void chooseBuyer (){
   emit(BuyerState(personColor:AppColors.kWhiteColor,containerColor:AppColors.kPrimaryColor,buttonColor:AppColors.kPrimaryColor));

  }
  void chooseSeller (){
    emit(SellerState(personColor:AppColors.kWhiteColor, containerColor:AppColors.kPrimaryColor,buttonColor:AppColors.kPrimaryColor));

  }


}