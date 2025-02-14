
import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/app_colors.dart';
class CustomTextFormField extends StatefulWidget {
   const CustomTextFormField({
    super.key, required this.name, required this.iconName,
     this.iconvisible, required this.obsscureText
  });
final String name ;
final  IconData iconName ;
final bool obsscureText ;
final IconData? iconvisible ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final myController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText:widget.obsscureText ,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.iconName,color: AppColors.kPrimaryColor,),
        suffixIcon: Icon(widget.iconvisible ),
        hintText: widget.name,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.kPrimaryColor)
        ),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        ),
        fillColor: AppColors.kWhiteColor ,
        filled: true,

      )
    );
  }
}