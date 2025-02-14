
import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/app_colors.dart';
class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key, required this.text,
  });
  final String text ;

  @override
  State<CustomPasswordTextFormField> createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  TextEditingController password = TextEditingController() ;
  bool visibility = false ;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: password,
        obscureText:!visibility ,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock,color: AppColors.kPrimaryColor,),
          suffixIcon: InkWell(
            onTap: () =>
                setState( () => visibility = !visibility,


            ),
            child: Icon( visibility ?
                Icons.visibility_outlined : Icons.visibility_off_outlined ,
            color: AppColors.kPrimaryColor,),
          ),

          hintText: widget.text,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.kPrimaryColor)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: AppColors.kWhiteColor ,
          filled: true,

        )
    );
  }}