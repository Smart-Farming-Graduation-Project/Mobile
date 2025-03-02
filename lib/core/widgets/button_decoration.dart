import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class ButtonDecoration extends StatelessWidget {

  const ButtonDecoration({super.key,  this.buttoncolor=AppColors.kPrimaryColor,
     this.buttonwidth=double.infinity,  this.buttonheight=50,
    required this.buttontext,  this.textcolor=AppColors.kWhiteColor,this.radius=20});
 final Color buttoncolor;
 final double buttonwidth ;
 final double buttonheight ;
 final String buttontext ;
  final Color textcolor ;
  final double radius ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
          decoration: BoxDecoration(
              color:buttoncolor ,
              borderRadius: BorderRadius.circular(10)
          ),
          width: buttonwidth,
          height: buttonheight,
          child: Center(
              child: Text( buttontext ,
              style:AppTextStyles.textStyle16.copyWith(color: textcolor,fontWeight: FontWeight.bold)
              )
          )
      ),
    );
  }
}
