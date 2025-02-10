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

            });
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: containerColor1,
            ),
                child:Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.person, size: 100
                            , color: personColor1),
                        Positioned(
                          bottom: 14,
                          right: 10,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: containerColor1 ,
                          ),
                        ),
                        Positioned(
                          bottom: 14,
                          right: 10,
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor:personColor1 ,
                            child:Icon(Icons.shopping_cart_outlined,
                                size: 20, color: containerColor1),
                          ),
                        ),
                      ],
                    ),
                    Text('Buyer',style: TextStyle(
                      color: personColor1,
                      fontSize: 18,
                    ),)
                  ],
                ),
              ),
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
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: containerColor2,
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.person, size: 100
                        , color: personColor2),
                    Positioned(
                      bottom: 14,
                      right: 10,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: containerColor2 ,
                      ),
                    ),
                    Positioned(
                      bottom: 14,
                      right: 10,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor:personColor2 ,
                        child:Icon( Icons.monetization_on_rounded,
                            size: 20, color: containerColor2),
                      ),
                    ),
                  ],
                ),
                Text('Seller',style: TextStyle(
                  color: personColor2,
                  fontSize: 18,
                ),)
              ],
            ),
          ),
        )
      ],
    );

  }
}

