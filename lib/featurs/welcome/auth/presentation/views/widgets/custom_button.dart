import 'package:crop_guard/core/utils/theme/app_text_styles.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  const CustomButton({super.key, required this.buttoncolor,
    required this.buttonwidth, required this.buttonheight,
    required this.buttontext, required this.textcolor,this.radius=20});
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
              style:AppTextStyles.textStyle24.copyWith(color: textcolor)
              )
          )
      ),
    );
  }
}
