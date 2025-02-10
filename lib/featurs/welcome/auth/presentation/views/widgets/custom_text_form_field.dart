
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText:widget.obsscureText ,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.iconName),
        suffixIcon: Icon(widget.iconvisible ),
        hintText: widget.name,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        ),
        fillColor: const Color(0xffD6D6D6),
        filled: true,

      )
    );
  }
}