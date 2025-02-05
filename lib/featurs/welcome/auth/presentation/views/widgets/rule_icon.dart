import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/app_colors.dart';

class RuleIcon extends StatefulWidget {
  const RuleIcon({super.key,});


  @override
  State<RuleIcon> createState() => _RuleIconState();
}

class _RuleIconState extends State<RuleIcon> {
bool onTap= false;
 Color containerColor1 = AppColors.white;
Color personColor1 =  AppColors.gray;
Color containerColor2 = AppColors.white;
Color personColor2 =  AppColors.gray;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (){
            onTap=true;
            if(onTap=true){
              containerColor1=AppColors.primary;
              personColor1 =  AppColors.white;
              containerColor2=AppColors.white;
              personColor2 =  AppColors.gray;
            }else{
              containerColor1=AppColors.white;
              personColor1 =  AppColors.gray;
              containerColor2=AppColors.white;
              personColor2 =  AppColors.gray;
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
              containerColor2=AppColors.primary;
              personColor2 =  AppColors.white;
              containerColor1=AppColors.white;
              personColor1 =  AppColors.gray;
            }else{
              containerColor2=AppColors.white;
              personColor2 =  AppColors.gray;
              containerColor1=AppColors.white;
              personColor1 =  AppColors.gray;
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

