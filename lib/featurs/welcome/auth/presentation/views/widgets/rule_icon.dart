import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/icon_buyer.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/icon_seller.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/theme/app_colors.dart';

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
        GestureDetector(
          onTap: (){
            onTap=true;
            if(onTap=true){
              containerColor1=AppColors.kPrimaryColor;
              personColor1 =  AppColors.kWhiteColor;
              containerColor2=AppColors.kWhiteColor;
              personColor2 =  AppColors.kGrayColor;

            }else{
              containerColor1=AppColors.kWhiteColor;
              personColor1 =  AppColors.kGrayColor;
              containerColor2=AppColors.kWhiteColor;
              personColor2 =  AppColors.kGrayColor;
            }
            setState(() {

            }
            );
          },
          child: const IconBuyer(),
        ),
        GestureDetector(
          onTap: (){
            onTap=true;
            if(onTap=true){
              containerColor2=AppColors.kPrimaryColor;
              personColor2 =  AppColors.kWhiteColor;
              containerColor1=AppColors.kWhiteColor;
              personColor1 =  AppColors.kGrayColor;

            }else{
              containerColor2=AppColors.kWhiteColor;
              personColor2 =  AppColors.kGrayColor;
              containerColor1=AppColors.kWhiteColor;
              personColor1 =  AppColors.kGrayColor;
            }
            setState(() {

            });
          },
          child:const IconSeller(),
        )
      ],
    );

  }
}


